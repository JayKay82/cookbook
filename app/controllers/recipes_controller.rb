class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    # Instantiates a new Reform RecipeForm with an empty ingredients array.
    @recipe_form = RecipeForm.new(current_user.recipes.build(ingredients: []))
  end

  def create
    # Gets rid of any ingredients added to the new recipe form but then later
    # removed from the form again. If a recipe doesn't have ingredients then
    # the normal params get passed in.
    if params.include?('ingredients_attributes')
      clean_params = ParamsSanitizer.sanitize_destroyed(recipe_params)
    else
      clean_params = recipe_params
    end

    # Instantiates a new Recipeform with only the wanted ingredients
    @recipe_form = RecipeForm.new(current_user.recipes.build(clean_params))
    if @recipe_form.validate(clean_params)
      @recipe_form.save
      redirect_to root_path, notice: 'Great! Recipe was successfully added.'
    else
      render :new, error: 'Unable to create recipe.'
    end
  end

  def edit
  end

  def  update
    # Cleans up the params for validations
    if params.include?('ingredients_attributes')
      clean_params = ParamsSanitizer.sanitize_destroyed(recipe_params)
    else
      clean_params = recipe_params
    end

    if recipe_form.validate(clean_params)
      # Manually updates recipes because I still haven't figured out how to
      # specifically target individual ingredients in @recipe_form to be
      # destroyed before saving the Reform RecipeForm.
      recipe = Recipe.find(params[:id])
      recipe.update_attributes(recipe_params)
      redirect_to recipe, notice: 'Successfully changed recipe.'
    else
      render :edit, error: 'Unable to update recipe.'
    end
  end

  def destroy
    if recipe.destroy
      redirect_to root_path, notice: 'The recipe was successfully deleted.'
    else
      redirect_to :back, error: 'Unable to delete recipe.'
    end
  end

  private

  def recent_recipes
    @recent_recipes ||= Recipe.recent
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

  def recipe_form
    @recipe_form ||= RecipeForm.new(Recipe.find(params[:id]))
  end

  def ingredients
    @ingredients = recipe.ingredients.all
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :cooking_steps, :prep_time, :cooking_time, ingredients_attributes: [:id, :quantity, :name, :prep_method, :_destroy])
  end

  helper_method :recent_recipes, :recipe, :recipe_form, :ingredients
end
