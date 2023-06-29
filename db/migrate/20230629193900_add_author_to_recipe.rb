class AddAuthorToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :author, :string
  end
end
