class TohScrape
  attr_reader :name, :id

  def initialize(inst, ing, dish_name)
    @id = nil
    @inst = inst
    @ing = ing
    @name = dish_name
  end

  def ingredients
    ing = @ing.gsub(('Ingredients'), "")
              .gsub(("\n"), "")
              .gsub(("\t"), "")
              .gsub(/([a-z])([A-Z])/, '\1' + "\n" + '\2')
              .gsub(('Text'), "")
              .gsub(('image/svg+xml'), "")
              .gsub(/(\d+-\d+\s*(?:\/\d+)?|\d+\/\d+|\d+)\s*([a-zA-Z]+)/, "\n\\1 \\2")
              .split("\n")
              .reject(&:blank?)
    ing.map { |ingredient| ingredient.strip }
  end

  def instructions
    @inst.gsub(('Directions'), '')
         .gsub(('   '), ' ')
         .gsub(("\n"), "")
         .gsub(("\t"), "")
  end
end