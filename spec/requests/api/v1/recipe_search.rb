require 'rails_helper'

RSpec.describe "Find recipes by search" do
  it "find by string" do
    VCR.use_cassette('coordinates') do
      get "/api/v1/searches?term=chicken"
      found_recipes = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(found_recipes).to have_key(:id)
      expect(found_recipes).to have_key(:type)
      # expect(found_recipes[:type]).to eq("meal")
      found_recipes[:attributes][:recipes].each do |meal|
        expect(meal).to have_key(:name)
        expect(meal[:name]).to_not eq(nil)
        expect(meal).to have_key(:instructions)
        expect(meal[:instructions]).to_not eq(nil)
        expect(meal).to have_key(:image_url)
        expect(meal).to have_key(:ingredients)
        expect(meal[:ingredients]).to_not eq(nil)
      end
    end
  end
end