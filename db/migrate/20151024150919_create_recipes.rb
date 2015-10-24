class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :cooking_steps
      t.integer :prep_time
      t.integer :cooking_time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
