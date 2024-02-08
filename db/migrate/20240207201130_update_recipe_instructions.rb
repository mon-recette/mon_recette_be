class UpdateRecipeInstructions < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :instructions
    add_column :recipes, :instructions, :string, array: true, default: []
  end
end
