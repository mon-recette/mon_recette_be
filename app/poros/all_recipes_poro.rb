class AllRecipesPoro
  attr_reader :id, :type, :recipes
  def initialize(name, ingredients, instructions, image)
    @id = nil
    @type = "recipe_list"
    @recipes = []
    result = {
      :name => name,
      :instructions => instructions,
      :image_url => image,
      :ingredients => ingredients
    }
    @recipes << result
  end
end