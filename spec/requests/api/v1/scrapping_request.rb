require 'rails_helper'

RSpec.describe 'recipes request' do
  describe 'web-scrapping' do
    it 'when user provides a link, response provides name ingredients and instructions' do
      # web scrap happy path
      VCR.use_cassette('recipe_search') do
        get '/api/v1/searches?term=https://www.awickedwhisk.com/homemade-chicken-ravioli-recipe-3/'

        expect(response).to be_successful
        expect(response.status).to eq(200)

        recipe = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(recipe).to have_key(:id)
        expect(recipe).to have_key(:type)
        expect(recipe).to have_key(:attributes)

        recipe_data = recipe[:attributes]

        expect(recipe_data).to have_key(:name)
        expect(recipe_data).to have_key(:ingredients)
        expect(recipe_data).to have_key(:instructions)
      end
    end

    it 'when user provides a link to the allrecipe website, response provides name ingredients and instructions' do
      # web scrap happy path
      VCR.use_cassette('allrecipe_search') do
        get '/api/v1/searches?term=https://www.allrecipes.com/recipe/9023/baked-teriyaki-chicken/'

        expect(response).to be_successful
        expect(response.status).to eq(200)

        recipe = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(recipe).to have_key(:id)
        expect(recipe).to have_key(:type)
        expect(recipe).to have_key(:attributes)

        recipe_data = recipe[:attributes]
        require 'pry';binding.pry
        expect(recipe_data).to have_key(:name)
        expect(recipe_data).to have_key(:ingredients)
        expect(recipe_data).to have_key(:instructions)
      end
    end
  end
end