class WebScrapeSerializer
  include JSONAPI::Serializer
  
  def self.recipes(recipe_data)
    {
      data: {
        id: 'null',
        type: 'recipes',
        attributes: {
          name: recipe_data.name,
          ingredients: recipe_data.ingredients,
          instructions: recipe_data.instructions,
        }
      }
    }
  end
end