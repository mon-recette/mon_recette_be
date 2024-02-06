require 'rails_helper'

RSpec.describe "add recipes to user" do
  it "with user id" do
    user = User.create!(email: "bob@test.com", password: "1234")
      params = {
        user_id: user.id,
        name: "banana bread",
        ingredients: ["onion", "banana"],
        instructions: "something"
    }
    post "/api/v1/recipes", params: params
    saved_recipe = JSON.parse(response.body, symbolize_names: true)
    expect(user.recipes.count).to eq(1)
    expect(saved_recipe[:success]).to eq("Recipe saved to user")
  end

  it "get user recipes" do
    user = User.create!(email: "bob@test.com", password: "1234")
      params = {
        user_id: user.id,
        name: "banana bread",
        ingredients: ["onion", "banana"],
        instructions: "something"
    }
    post "/api/v1/recipes", params: params

    id_params = {
      user_id: user.id
    }
    get "/api/v1/recipes", params: id_params
    recipe_list = JSON.parse(response.body, symbolize_names: true)
    require 'pry';binding.pry
  end
end