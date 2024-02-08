class Api::V1::RecipesController < ApplicationController
  def index
    if params[:user_id].present?
      user = User.find_by(id: params[:user_id])
      if user
        render json: UserRecipesSerializer.recipe_list(user), status: 200
      else
        render json: {errors: "User doesn't exist"}, status: 404
      end
    else
      render json: {errors: "Missing information"}, status: 404
    end
  end

  def create
    if params[:user_id].present? && params[:name].present? && params[:ingredients].present? && params[:instructions].present?
      user = User.find_by(id: params[:user_id])
      if user
        recipe = Recipe.new(user_id: user.id,
        name: params[:name],
          ingredients: params[:ingredients],
          instructions: params[:instructions])
        recipe.save
        render json: {success: "Recipe saved to user"}, status: 201
      else
        render json: {errors: "User doesn't exist"}, status: 404
      end
    else
      render json: {errors: "Missing information"}, status: 404
    end
  end
end