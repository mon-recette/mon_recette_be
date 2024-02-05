require 'rails_helper'

RSpec.describe TohScrapeFacade do
  describe 'facade' do
    it 'creates web scrape poro from web scrape info' do
      VCR.use_cassette('taste_of_home') do
        scrape = TohScrapeFacade.new.recipe_details('https://www.tasteofhome.com/recipes/chocolate-cupcakes-with-strawberry-filling/')
        
        expect(scrape).to be_a(TohScrape)
        expect(scrape.name).to eq('Chocolate Cupcakes with Strawberry Filling')
        expect(scrape.ingredients).to be_an(Array)
        expect(scrape.ingredients).to include('1/2 cup buttermilk')
        expect(scrape.instructions).to be_a(String)
        expect(scrape.instructions).to include('Cool in pans 10 minutes before removing to wire racks to cool completely.')
      end
    end
  end
end