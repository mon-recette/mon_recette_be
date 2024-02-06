class UserRecipesPoro
  attr_reader :id, :type, :user_id, :recipes
  def initialize(data)
    @id = nil
    @type = "user_recipe"
    @user_id = data.first.user_id
    @recipes = []

    data.each do |recipe|
      result = {
        :name => recipe[:name],
        :ingredients => recipe[:ingredients],
        :instructions => recipe[:instructions]
      }
      @recipes << result
    end
  end
end