class AllRecipesScrapeFacade
  def recipe_details(url)
    document = WebScrapeService.new.scrape(url)
    ingredients_container = document.css("ul.mntl-structured-ingredients__list")
    instructions_container = document.css("ol.comp")

    # initializing the list of objects 
    # that will contain the scraped data 
    ingredients_list = [] 
    
    # iterating over the list of HTML products 
    ingredients_container.css("li.mntl-structured-ingredients__list-item").each do |html_product|  
      single = html_product.text.gsub(/\n/,"") 
      ingredients_list << single 
    end
    instructions_list = []
    instructions_container.css("p.comp").each do |instruct|
      single = instruct.text.gsub(/\n/,"") 
      instructions_list << single
    end
    image_url = instructions_container.css("img").first.attribute_nodes.first.value
    name = document.css("h1.comp").first.children.text.gsub(/\n/,"") 
    AllRecipesPoro.new(name, ingredients_list, instructions_list, image_url) 
  end
end