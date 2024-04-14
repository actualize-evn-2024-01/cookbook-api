class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    if params[:search]
      @recipes = @recipes.where("title ILIKE ?", "%#{params[:search]}%")
    end

    @recipes = @recipes.order(:id => :asc)

    render :index
  end

  def create
    @recipe = Recipe.create(
      user_id: current_user.id,
      title: params[:title],
      chef: params[:chef],
      image_url: params[:image_url],
      prep_time: params[:prep_time],
      ingredients: params[:ingredients],
      directions: params[:directions],
    )
    render :show
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(
      title: params[:title] || @recipe.title,
      chef: params[:chef] || @recipe.chef,
      image_url: params[:image_url] || @recipe.image_url,
      prep_time: params[:prep_time] || @recipe.prep_time,
      ingredients: params[:ingredients] || @recipe.ingredients,
      directions: params[:directions] || @recipe.directions,
    )
    render :show
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    render json: { message: "Recipe destroyed succesfully!" }
  end
end
