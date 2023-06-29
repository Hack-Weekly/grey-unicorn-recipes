class PagesController < ApplicationController
  def home
    @recipes = Recipe.all
  end

  def recipes
  end
end
