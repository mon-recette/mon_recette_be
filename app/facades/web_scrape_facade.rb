class WebScrapeFacade
  def web_scrap(web)
    data = WebScrapeService.new.scrape(web)
  end

  def ingredients(web)
    web_scrap(web).css('div[class*="ingredients"]').text
  end

  def instructions(web)
    web_scrap(web).css('div[class*="instructions"]').text
  end

  def name(web)
    web_scrap(web).css('h1[class*="title"]').text
  end

  def recipe_details(web)
    dish_name = name(web)
    inst = instructions(web)
    ing = ingredients(web)
    WebScrape.new(inst, ing, dish_name)
  end
end