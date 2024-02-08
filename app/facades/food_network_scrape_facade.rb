class FoodNetworkScrapeFacade
  def recipe_details(url)
    document = WebScrapeService.new.scrape(url)

    ingredients_container = document.css('div[class*="o-Ingredients__m-Body"]').text.split("Deselect All").last.gsub(/\n+/, "").strip.gsub(/ {2,}/, "\n").split("\n")
    instructions_list = document.css('div[class*="o-Method__m-Body"]').text.gsub(/\n+/, "").strip.gsub(/ {2,}/, "\n")
    name = document.css('h1[class*="o-AssetTitle__a-Headline"]').first.children.text.gsub(/\n/,"").gsub(/ {2,}/, "")
    FoodNetworkPoro.new(name, ingredients_container, instructions_list)
  end
end
