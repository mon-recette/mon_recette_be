class UserRecipesPoro
  attr_reader :id, :type, :user_id, :recipes
  def initialize(user_id, data)
    @id = nil
    @type = "user_recipe"
    @user_id = user_id
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