require 'rails_helper'

RSpec.describe WebScrapeFacade do
  describe 'facade' do
    it 'creates web scrape poro from web scrape info' do
      VCR.use_cassette('recipe_search') do
        scrape = WebScrapeFacade.new.recipe_details('https://www.awickedwhisk.com/homemade-chicken-ravioli-recipe-3/')
        
        expect(scrape).to be_a(WebScrape)
        expect(scrape.name).to eq('Homemade Chicken Ravioli Recipe')
        expect(scrape.ingredients).to be_an(Array)
        expect(scrape.ingredients).to include('Ravioli Dough')
        expect(scrape.instructions).to be_a(Array)
      end
    end
  end
end