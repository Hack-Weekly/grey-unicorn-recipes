class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
