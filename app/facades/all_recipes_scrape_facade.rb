class AllRecipesScrapeFacade
  def recipe_details(url)
    document = WebScrapeService.new.scrape(url)
    ingredients_container = document.css("ul.mntl-structured-ingredients__list")
    instructions_container = document.css("ol.comp")

    ingredients_list = []  
    ingredients_container.css("li.mntl-structured-ingredients__list-item").each do |html_product|  
      single = html_product.text.gsub(/\n/,"") 
      ingredients_list << single 
    end

    instructions_list = []
    instructions_container.css("p.comp").each do |instruct|
      single = instruct.text.gsub(/\n/,"") 
      instructions_list << single
    end
    
    name = document.css("h1.comp").first.children.text.gsub(/\n/,"") 
    joined_instructions = instructions_list.join
    AllRecipesPoro.new(name, ingredients_list, joined_instructions) 
  end
end