class RecipesController < ApplicationController
  def index
    @recent_recipes ||= Recipe.recent
  end

  def show
    @recipe ||= Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
  end

  def new
    @recipe = current_user.recipes.build
    @recipe.ingredients.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to root_path, notice: 'Great! Recipe was successfully added.'
    else
      render :new, error: 'Unable to create recipe.'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def  update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Successfully changed recipe.'
    else
      render :edit, error: 'Unable to update recipe.'
    end
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :cooking_steps, :prep_time, :cooking_time, ingredients_attributes: [:id, :quantity, :name, :prep_method, :_destroy])
  end

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
