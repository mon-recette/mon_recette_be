class MealPoro
  attr_reader :id, :type, :name, :address, :lat, :lon, :distance

  def initialize(data)
    @id = data[:nothing]
    @type = data[:strArea]
    @name = data[:strMeal]
    @instructions = data[:strInstructions]
    @image = data[:strImageSource]
    ingredient_list = []
    list_size = 1
    list_max = 21
    while list_size < list_max
      ingredient = data[:"strMeasure#{list_size}"] + " " + data[:"strIngredient#{list_size}"]
      ingredient_list << ingredient
      list_size += 1
    end
    @ingredients = ingredient_list.delete_if(&:blank?)
  end
end