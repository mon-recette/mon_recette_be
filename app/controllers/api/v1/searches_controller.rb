class Api::V1::SearchesController < ApplicationController
  def index
    search_term = params[:term]
    if search_term.include?('https://www.awickedwhisk.com')
      scrape_web(search_term)
    elsif search_term.include?('https://www.allrecipes.com')
      facade = AllRecipesScrapeFacade.new
      recipe_results = facade.recipe_details(search_term)
      render json: AllRecipesSerializer.new(recipe_results), status: 200
    elsif search_term.include?('https://www.foodnetwork.com')
      facade = FoodNetworkScrapeFacade.new
      recipe_results = facade.recipe_details(search_term)
      render json: WebScrapeSerializer.recipes(recipe_results), status: 200
    else
      facade = SearchFacade.new
      results = facade.get_recipes(search_term)
      if results == "No results found"
        render json: {errors: results}, status: 404
      else
        render json: MealSerializer.new(results), status: 200
      end
    end
  end

  private

  def scrape_web(website)
    if WebScrapeService.new.conn(website).status == 200
      render json: WebScrapeSerializer.recipes(WebScrapeFacade.new.recipe_details(website)), status: :ok
    else
      render json: { errors: [title: "Please provide a correct website link", status: "400"]}, status: :bad_request
    end
  end
end