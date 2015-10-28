class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recipe_form = RecipeForm.new(current_user.recipes.build(ingredients: []))
  end

  def create
    # raise recipe_params
    @recipe_form = RecipeForm.new(current_user.recipes.build(recipe_params))
    if @recipe_form.validate(params[:recipe])
      @recipe_form.save
      redirect_to root_path, notice: 'Great! Recipe was successfully added.'
    else
      render :new, error: 'Unable to create recipe.'
    end
  end

  def edit
    @recipe_form = RecipeForm.new(Recipe.find(params[:id]))
  end

  def  update
    @recipe_form = RecipeForm.new(Recipe.find(params[:id]))
    if @recipe_form.validate(recipe_params)
      @recipe_form.save
      redirect_to recipe, notice: 'Successfully changed recipe.'
    else
      render :edit, error: 'Unable to update recipe.'
    end
  end

  def destroy
  end

  private

  def recent_recipes
    @recent_recipes ||= Recipe.recent
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

  def ingredients
    @ingredients = recipe.ingredients.all
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :cooking_steps, :prep_time, :cooking_time, ingredients_attributes: [:id, :quantity, :name, :prep_method, :_destroy])
  end

  helper_method :recent_recipes, :recipe, :ingredients
end

# new
# @recipe_form ||= RecipeForm.new(current_user.recipes.build(ingredients: []))
# @recipe_form.ingredients << Ingredient.new
# @recipe_form = RecipeForm.new(current_user)
# 3.times {@recipe.ingredients.build}

# create1
# @recipe_form = RecipeForm.new(current_user.recipes.build)
# if @recipe_form.validate(params[:recipe])
#   @recipe_form.save
#   redirect_to root_path, notice: 'Great! Recipe was successfully added.'
# end

# create2
# if @recipe_form.submit(recipe_params)
# # @recipe = current_user.recipes.build(recipe_params)
# # if @recipe.save!
#   redirect_to root_path, notice: 'Great! Recipe was successfully added.'
# else
#   render :new
# end
