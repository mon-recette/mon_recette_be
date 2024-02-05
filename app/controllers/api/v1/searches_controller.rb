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
    results = SearchFacade.new.get_recipes(search_term)
    if results == "No results found"
      render json: {errors: results}, status: 404
    else
      render json: MealSerializer.new(results), status: 200
    end
  end

  def scrape_web(website)
    if WebScrapeService.new.conn(website).status == 200
      scrape_from_sites(website)
    else
      render json: { errors: [title: "Please provide a correct website link", status: "400"]}, status: :bad_request
    end
  end

  def scrape_from_sites(website)
    if website.include?('awickedwhisk.com')
      render json: WebScrapeSerializer.recipes(WebScrapeFacade.new.recipe_details(website)), status: :ok
    elsif website.include?('allrecipes.com')
      facade = AllRecipesScrapeFacade.new
      recipe_results = facade.recipe_details(website)
      render json: WebScrapeSerializer.recipes(recipe_results), status: 200
    elsif website.include?('tasteofhome.com')
      render json: WebScrapeSerializer.recipes(TohScrapeFacade.new.recipe_details(website)), status: :ok
    end
  end
end