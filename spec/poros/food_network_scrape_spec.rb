require 'rails_helper'

RSpec.describe FoodNetworkPoro do
  describe 'foodnetwork' do
    it 'exist' do
      instructions = "Instructions Heat up the oven to 350F. Mix all ingredients. Bake. Enjoy."
      ingredients =  ["2 tbsp water," "3 cups flour," "2-3 pinches of salt"]
      name = "random stuff"
      recipe = FoodNetworkPoro.new(name, ingredients, instructions)
      expect(recipe.name).to eq('random stuff')
      expect(recipe.ingredients).to be_an(Array)
      expect(recipe.instructions).to be_a(String)
    end
  end
end