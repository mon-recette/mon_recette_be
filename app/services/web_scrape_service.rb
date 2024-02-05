class WebScrapeService 
  def conn(url)
    Faraday.get(url)
  end

  def scrape(url)
    response = conn(url)
    Nokogiri::HTML(response.body)
  end
end