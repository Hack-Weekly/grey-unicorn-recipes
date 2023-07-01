class RemoveDescriptionFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :description
  end
end
