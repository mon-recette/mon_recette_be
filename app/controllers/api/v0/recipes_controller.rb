class Api::V0::RecipesController < ApplicationController

  def index
    web = params[:search]
    # response = Faraday.get(web)

    # web_data = Nokogiri::HTML(response.body)

    # list = web_data.css('div[class*="ingredients"]').text
    # formatted_list = list.gsub(/#{Regexp.escape('Ingredients')}/, "#{'Ingredients'}\n")
    # another = formatted_list.gsub(/([a-z])([A-Z])/, '\1' + "\n" + '\2')
    # next_format = another.gsub(/([a-z])(\d)/, '\1 \2')

    # formatted_string = next_format.gsub(/(\d+\/\d+\s*-\s*\d+\/\d+|\d+\/\d+|\d+)\s*([a-zA-Z]+)/, "\n\\1 \\2")

    # array = formatted_string.split("\n")
    # final_array = array.map { |ingredient| ingredient.strip }


    # instructions = web_data.css('div[class*="instructions"]').text
    
    # formatted = instructions.gsub(/([A-Z][a-z]*)/, "\n\\1")
    
    # modified_string = formatted.gsub(/#{Regexp.escape('Instructions')}/, "#{'Instructions'}\n")

    render json: WebScrapSerializer.new(WebScrapFacade.new.web_scrap(web)), status: :ok
  end
end
