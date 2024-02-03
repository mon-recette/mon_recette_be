class Api::V1::SearchesController < ApplicationController
  def index
    facade = SearchFacade.new
    results = facade.get_recipes(params[:term])
    if results == "No results found"
      render json: {errors: results}, status: 404
    else
      render json: MealSerializer.new(results), status: 200
    end
  end
end