class RecipesController < ApplicationController
  def one_recipe_method
    @recipe = Recipe.first
    render template: "recipes/show"
  end
end
