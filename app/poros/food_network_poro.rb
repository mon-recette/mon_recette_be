class FoodNetworkPoro
  attr_reader :id, :type, :name, :instructions, :ingredients
  def initialize(name, ingredients, instructions)
    @id = nil
    @type = "recipe"
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end
end