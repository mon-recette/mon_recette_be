class Api::V1::RecipesController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    render json: UserRecipesSerializer.new(UserRecipesPoro.new(user.recipes.all)), status: 200
  end

  def create
    user = User.find_by(id: params[:user_id])
    recipe = Recipe.new(user_id: user.id,
     name: params[:name],
      ingredients: params[:ingredients],
       instructions: params[:instructions])
    recipe.save
    render json: {success: "Recipe saved to user"}, status: 201
  end
end