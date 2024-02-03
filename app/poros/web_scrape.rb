class WebScrape
  attr_reader :name, :id

  def initialize(inst, ing, dish_name)
    @id = nil
    @inst = inst
    @ing = ing
    @name = dish_name
  end

  def ingredients
    array = @ing.gsub(/#{Regexp.escape('Ingredients')}/, "#{'Ingredients'}\n")
                  .gsub(/([a-z])([A-Z])/, '\1' + "\n" + '\2')
                  .gsub(/([a-z])(\d)/, '\1 \2')
                  .gsub(/(\d+\/\d+\s*-\s*\d+\/\d+|\d+\/\d+|\d+)\s*([a-zA-Z]+)/, "\n\\1 \\2")
                  .split("\n")

    array.map { |ingredient| ingredient.strip }
  end

  def instructions
    @inst.gsub(/([A-Z][a-z]*)/, "\n\\1")
        .gsub(/#{Regexp.escape('Instructions')}/, "#{'Instructions'}\n")
  end
end