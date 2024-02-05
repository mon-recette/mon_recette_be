class AllRecipesService
  def get_url(url)
    response = conn.get(url)
    x = JSON.parse(response.body, symbolize_names: true)
    require 'pry';binding.pry
  end

  def recipe_details(url)
    get_url(url)
  end

  def conn
    Faraday.new(url: "")
  end
end