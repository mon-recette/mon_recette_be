require 'rails_helper'

RSpec.describe "Find recipes by search" do
  it "find by string" do
    get "/api/v1/searches?term=chicken"
    # found_recipes = JSON.parse(response.body, symbolize_names: true)[:data]
    # expect(found_markets.count).to eq(2)
  end
end