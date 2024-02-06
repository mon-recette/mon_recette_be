class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :instructions
      t.string :name

      t.timestamps
    end
  end
end
