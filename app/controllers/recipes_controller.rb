class RecipesController < ApplicationController
  def one_recipe_method
    recipe = Recipe.first
    render json: { message: "Hello", title: recipe.title }
  end
end
