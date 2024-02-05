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

    it 'does not work without proper website' do
      VCR.use_cassette('fake_site') do
        get '/api/v1/searches?term=https://www.allrecipes.com/recipe/240400/skillet-chicken'

        expect(response.status).to eq(400)

        results = JSON.parse(response.body, symbolize_names: true)
        expect(results[:errors].first[:status]).to eq("400")
        expect(results[:errors].first[:title]).to eq("Please provide a correct website link")
      end
    end

    it 'works with taste of home' do
      VCR.use_cassette('taste_of_home') do
        get '/api/v1/searches?term=https://www.tasteofhome.com/recipes/chocolate-cupcakes-with-strawberry-filling/'
        
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

        expect(recipe_data[:ingredients]).to include('1 large egg, room temperature')
        expect(recipe_data[:instructions]).to include('Preheat oven to 350°')
      end
    end
  end
end