class MealPoro
  attr_reader :id, :type, :recipes

  def initialize(data)
    @id = data[:nothing]
    @type = "recipe_list"
    @recipes = []
    data[:meals].each do |meal|
      ingredient_list = []
      list_size = 0
      list_max = 20
      while list_size < list_max
        list_size += 1
        if meal[:"strMeasure#{list_size}"] || meal[:"strIngredient#{list_size}"]
          ingredient = meal[:"strMeasure#{list_size}"] + " " + meal[:"strIngredient#{list_size}"]
          ingredient_list << ingredient
        end
      end
      instructions = meal[:strInstructions].gsub("\r\n", '').gsub(/STEP \d+/, '')
      result = {
        :name => meal[:strMeal],
        :instructions => instructions,
        :image_url => meal[:strMealThumb],
        :ingredients => ingredient_list.delete_if(&:blank?)
      }
      @recipes << result
    end
  end
end