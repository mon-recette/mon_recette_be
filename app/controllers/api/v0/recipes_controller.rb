class Api::V0::RecipesController < ApplicationController

  def index
    response = Faraday.get('https://www.awickedwhisk.com/homemade-chicken-ravioli-recipe-3/')

    document = Nokogiri::HTML(response.body)
    list = document.css('div[class*="ingredients"]').text
    formatted_list = list.gsub(/#{Regexp.escape('Ingredients')}/, "#{'Ingredients'}\n")
    another = formatted_list.gsub(/([a-z])([A-Z])/, '\1' + "\n" + '\2')
    next_format = another.gsub(/([a-z])(\d)/, '\1 \2')

    formatted_string = next_format.gsub(/(\d+\/\d+\s*-\s*\d+\/\d+|\d+\/\d+|\d+)\s*([a-zA-Z]+)/, "\n\\1 \\2")

    array = formatted_string.split("\n")
    final_array = array.map { |ingredient| ingredient.strip }


    instructions = document.css('div[class*="instructions"]').text
    
    formatted = instructions.gsub(/([A-Z][a-z]*)/, "\n\\1")
    
    modified_string = formatted.gsub(/#{Regexp.escape('Instructions')}/, "#{'Instructions'}\n")
    require 'pry'; binding.pry
    list.each do |x|
    end
  end
end
