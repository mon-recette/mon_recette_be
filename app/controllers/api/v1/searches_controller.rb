class Api::V1::SearchesController < ApplicationController
  def index
    search_term = params[:term]
    if search_term.include?('http')
      scrape_web(search_term)
    else
      food_search(search_term)
    end
  end

  private
  def food_search(search_term)
    if Rails.cache.exist?(search_term)
      render json: MealSerializer.new(Rails.cache.read(search_term)), status: 200
    else
      results = SearchFacade.new.get_recipes(search_term)
      if results == "No results found"
        render json: {errors: results}, status: 404
      else
        Rails.cache.write(search_term, results)
        render json: MealSerializer.new(results), status: 200
      end
    end
  end

  def scrape_web(website)
    if Rails.cache.exist?(website)
      render json: WebScrapeSerializer.recipes(Rails.cache.read(website)), status: 200
    else
      if WebScrapeService.new.conn(website).status == 200
        scrape_from_sites(website)
      else
        render json: { errors: [title: "Please provide a correct website link", status: "400"]}, status: :bad_request
      end
    end
  end

  def scrape_from_sites(website)
    facade = ""
    if website.include?('awickedwhisk.com') || website.include?('allrecipes.com') || website.include?('foodnetwork.com') || website.include?('tasteofhome.com')
      if website.include?('awickedwhisk.com')
        facade = WebScrapeFacade.new
      elsif website.include?('allrecipes.com')
        facade = AllRecipesScrapeFacade.new
      elsif website.include?('foodnetwork.com')
        facade = FoodNetworkScrapeFacade.new
      elsif website.include?('tasteofhome.com')
        facade = TohScrapeFacade.new
      end
      recipe_results = facade.recipe_details(website)
      Rails.cache.write(website, recipe_results)
      render json: WebScrapeSerializer.recipes(recipe_results), status: :ok
    else
      render json: { errors: [title: "Please provide a link from websites: a wicked whisk, all recipes, food network, taste of home", status: "400"]}, status: :bad_request
    end
  end
end