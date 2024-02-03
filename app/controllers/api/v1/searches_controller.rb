class Api::V1::SearchesController < ApplicationController
  def index
    search_term = params[:term]
    if search_term.include?('http')
      render json: WebScrapeSerializer.recipes(WebScrapeFacade.new.recipe_details(search_term)), status: :ok
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
end