class SearchFacade
  def get_recipes(term)
    service = SearchService.new
    data = service.get_recipes(term)
    results = MealPoro.new(data)
    results
  end
end