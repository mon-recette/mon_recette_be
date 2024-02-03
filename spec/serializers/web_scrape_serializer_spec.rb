require 'rails_helper'

RSpec.describe WebScrapeSerializer do
  describe 'serializer' do
    it 'gives data with id, type, attributes' do
      ins = 'Instructions Heat up the oven to 350F. Mix all ingredients. Bake. Enjoy.'
      ing=  'Ingredients 2 tbsp water 3 cups flour 2-3 pinches of salt'
      name= 'random stuff'
      recipe = WebScrape.new(ins, ing, name)
      serialized = WebScrapeSerializer.recipes(recipe)

      expect(serialized).to have_key(:data)
      expect(serialized[:data]).to have_key(:id)
      expect(serialized[:data]).to have_key(:type)
      expect(serialized[:data]).to have_key(:attributes)
      expect(serialized[:data][:type]).to eq('recipes')
      expect(serialized[:data][:attributes]).to have_key(:name)
      expect(serialized[:data][:attributes]).to have_key(:ingredients)
      expect(serialized[:data][:attributes]).to have_key(:instructions)
      expect(serialized[:data][:attributes][:name]).to eq('random stuff')
    end
  end
end