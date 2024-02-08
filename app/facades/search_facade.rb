class SearchFacade
  def get_recipes(term)
    service = SearchService.new
    data = service.get_recipes(term)
    if data[:meals]
      results = MealPoro.new(data)
    else
      results = "No results found"
    end
  end
end