require 'rails_helper'

RSpec.describe FoodNetworkScrapeFacade do
  describe 'facade' do
    it 'creates web scrape poro from food network info' do
      VCR.use_cassette('foodnetwork_search') do
        scrape = FoodNetworkScrapeFacade.new.recipe_details('https://www.foodnetwork.com/recipes/food-network-kitchen/the-perfect-grilled-cheese-3636831')
        
        expect(scrape).to be_a(FoodNetworkPoro)
        expect(scrape.name).to eq('The Perfect Grilled Cheese')
        expect(scrape.ingredients).to be_an(Array)
        expect(scrape.ingredients.count).to eq(3)
        expect(scrape.instructions).to be_a(Array)
      end
    end
  end
end