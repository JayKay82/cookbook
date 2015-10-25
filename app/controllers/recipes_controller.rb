class RecipesController < ApplicationController
  def index
  end

  def show
  end

  private

  def recent_recipes
    @recent_recipes ||= Recipe.recent
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

  def ingredients
    @ingredients ||= recipe.ingredients.all
  end

  helper_method :recent_recipes, :recipe, :ingredients
end
