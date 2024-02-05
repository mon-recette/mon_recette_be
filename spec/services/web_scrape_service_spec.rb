require 'rails_helper'

RSpec.describe WebScrapeService do

  describe 'web scrape service' do
    it 'grabs data from web' do
      VCR.use_cassette('recipe_search') do
        scrape = WebScrapeService.new.scrape('https://www.awickedwhisk.com/homemade-chicken-ravioli-recipe-3/')
        expect(scrape.class).to eq(Nokogiri::HTML4::Document)
      end
    end
  end
end