class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def create
    @recipe = Recipe.create(
      title: "Mud Pie",
      chef: "Peter Jang",
      image_url: "test.jpg",
      prep_time: 10,
      ingredients: "Mud",
      directions: "Bake the mud",
    )
    render :show
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show
  end
end
