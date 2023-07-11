class AddAuthorTypeToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :author_type, :string
  end
end
