class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.text :body

      t.timestamps
    end
  end
end
