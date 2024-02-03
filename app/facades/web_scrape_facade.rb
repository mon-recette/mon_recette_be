class WebScrapeFacade
  def web_scrap(web)
    data = WebScrapeService.new.scrape(web)
  end

  def ingredients(web)
    list = web_scrap(web).css('div[class*="ingredients"]').text
    formatted_list = list.gsub(/#{Regexp.escape('Ingredients')}/, "#{'Ingredients'}\n")
                          .gsub(/([a-z])([A-Z])/, '\1' + "\n" + '\2')
                          .gsub(/([a-z])(\d)/, '\1 \2')
                          .gsub(/(\d+\/\d+\s*-\s*\d+\/\d+|\d+\/\d+|\d+)\s*([a-zA-Z]+)/, "\n\\1 \\2")

    array = formatted_list.split("\n")
    final_array = array.map { |ingredient| ingredient.strip }
  end

  def instructions(web)
    inst = web_scrap(web).css('div[class*="instructions"]').text
    
    instructions.gsub(/([A-Z][a-z]*)/, "\n\\1")
                .gsub(/#{Regexp.escape('Instructions')}/, "#{'Instructions'}\n")
  end

  def recipe_details(web)
    inst = instructions(web)
    ing = ingredients(web)
    WebScrape.new(inst, ing)
  end
end