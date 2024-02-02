class SearchFacade
  def get_recipes(term)
    service = SearchService.new
    data = service.get_recipes(term)
    results = data[:meals].map do |meal_data|
      MealPoro.new(meal_data)
    end
    results
  end
end