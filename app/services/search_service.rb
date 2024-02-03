class SearchService
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_recipes(term)
    get_url("?s=#{term}")
  end

  def conn
    Faraday.new(url: "https://www.themealdb.com/api/json/v1/1/search.php")
  end
end