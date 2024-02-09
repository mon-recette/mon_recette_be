class UserRecipesSerializer
  include JSONAPI::Serializer
  
  def self.recipe_list(user)
    recipes = []
    user.recipes.each do |recipe|
      result = {
        :name => recipe[:name],
        :ingredients => recipe[:ingredients],
        :instructions => recipe[:instructions]
      }
      recipes << result
    end
    {
      data: {
        id: 'null',
        type: 'user_recipes',
        attributes: {
          user_id: user.id,
          recipes: recipes
        }
      }
    }
  end
  
end