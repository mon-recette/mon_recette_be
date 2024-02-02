class WebScrapService 
  def conn(url)
    Faraday.get(url)
  end

  def scrape(url)
    response = conn(url)
    x = Nokogiri::HTML(response.body)
  end


end