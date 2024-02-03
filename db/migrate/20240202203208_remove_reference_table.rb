class RemoveReferenceTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_recipes
    add_reference :recipes, :user, null: false, foreign_key: true
  end
end
