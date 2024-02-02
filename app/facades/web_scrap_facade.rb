class WebScrapFacade
  def web_scrap(web)
    data = WebScrapService.new.scrape(web)
  end

end