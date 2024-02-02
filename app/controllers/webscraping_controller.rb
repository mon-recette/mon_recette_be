class WebscrapingController < ApplicationController
  
  def webscrape
    # foodnetwork
    # response = Faraday.get('https://www.foodnetwork.com/recipes/food-network-kitchen/the-perfect-grilled-cheese-3636831')
    # document = Nokogiri::HTML(response.body)
    # list = document.css('div[class*="o-Ingredients__m-Body"]').text
    # f_list = list.strip.gsub(/\n+/, "\n").gsub(/\n +/, ' ').gsub(/^Deselect All\s+/, '').gsub(/\s+/, ' ').strip
    # require 'pry'; binding.pry
  end

end