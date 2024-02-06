class AddArrayToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :ingredients, :string, array: true, default: []
  end
end
