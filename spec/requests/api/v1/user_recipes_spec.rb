require 'rails_helper'

RSpec.describe "add recipes to user" do
  it "with user id" do
    user = User.create!(email: "bob@test.com", password: "1234")
      params = {
        user_id: user.id,
        name: "banana bread",
        ingredients: ["onion", "banana"],
        instructions: ["something"]
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
        instructions: ["something"]
    }
    post "/api/v1/recipes", params: params

    id_params = {
      user_id: user.id
    }
    get "/api/v1/recipes", params: id_params
    recipe_list = JSON.parse(response.body, symbolize_names: true)
    expect(recipe_list[:data][:attributes][:recipes].count).to eq(1)
  end

  it "if user doesn't exist" do
      params = {
        user_id: 1,
        name: "banana bread",
        ingredients: ["onion", "banana"],
        instructions: ["something"]
    }
    post "/api/v1/recipes", params: params
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to eq("User doesn't exist")
  end

  it "if missing params" do
    user = User.create!(email: "bob@test.com", password: "1234")
    params = {
      user_id: user.id,
      ingredients: ["onion", "banana"],
      instructions: ["something"]
    }
    post "/api/v1/recipes", params: params
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to eq("Missing information")
  end

  it "if missing user id" do
    id_params = {
      
    }
    get "/api/v1/recipes", params: id_params
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to eq("Missing information")
  end

  it "if user doesn't exist for recipes" do
    id_params = {
      user_id: 1
    }
    get "/api/v1/recipes", params: id_params
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to eq("User doesn't exist")
  end

  it "user has no recipes" do
    user = User.create!(email: "bob@test.com", password: "1234")
    id_params = {
      user_id: user.id
    }
    get "/api/v1/recipes", params: id_params
    recipe_list = JSON.parse(response.body, symbolize_names: true)
    expect(recipe_list[:data][:attributes][:recipes].count).to eq(0)
  end
end