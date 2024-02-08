require 'rails_helper'

RSpec.describe WebScrape do
  describe 'webscrape' do
    it 'exist' do
      ins = 'Instructions Heat up the oven to 350F. Mix all ingredients. Bake. Enjoy.'
      ing=  'Ingredients 2 tbsp water 3 cups flour 2-3 pinches of salt'
      name= 'random stuff'
      recipe = WebScrape.new(ins, ing, name)
      expect(recipe.name).to eq('random stuff')
      expect(recipe.ingredients).to be_an(Array)
      expect(recipe.ingredients.count).to eq(3)
      expect(recipe.instructions).to be_an(Array)
    end
  end
end