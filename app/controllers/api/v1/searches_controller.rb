class Api::V1::SearchesController < ApplicationController
  def index
    facade = SearchFacade.new
    results = facade.get_recipes(params[:term])
    # render json: AtmSerializer.new(results), status: 200
  end
end