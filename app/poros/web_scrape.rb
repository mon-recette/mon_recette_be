class WebScrape
  attr_reader :name, :id

  def initialize(inst, ing, dish_name)
    @id = nil
    @inst = inst
    @ing = ing
    @name = dish_name
  end

  def ingredients
    ing = @ing.gsub(('Ingredients'), "")
                  .gsub(/([a-z])([A-Z])/, '\1' + "\n" + '\2')
                  .gsub(/([a-z])(\d)/, '\1 \2')
                  .gsub(/(\d+-\d+\s*(?:\/\d+)?|\d+\/\d+|\d+)\s*([a-zA-Z]+)/, "\n\\1 \\2")
                  .split("\n")
                  .reject(&:blank?)

    ing.map { |ingredient| ingredient.strip }
  end

  def instructions
    inst = @inst.gsub(('Instructions'), '')
                .gsub(/([a-z])([A-Z])/, '\1' + ' ' + '\2')
                .split(/(?<=\.) /)
    inst.map { |sentence| sentence.reverse.strip.reverse }
  end
end