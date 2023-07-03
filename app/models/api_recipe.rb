class ApiRecipe
  include ActiveModel::Model
  attr_accessor :title, :ingredients, :servings, :instructions

  def initialize(attributes = {})
    @title = attributes["title"]
    @ingredients = attributes["ingredients"]
    @servings = attributes["servings"]
    @instructions = attributes["instructions"]
  end

  def persisted?
    false
  end
end
