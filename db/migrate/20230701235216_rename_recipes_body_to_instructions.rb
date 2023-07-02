class RenameRecipesBodyToInstructions < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :body, :instructions
  end
end
