# class RecipeForm
#   include ActiveModel::Model
#   attr_accessor :title, :description, :cooking_steps, :prep_time, :cooking_time, :user, :params, :recipe, :errors
#
#   def initialize(user)
#     @user = user
#     self.recipe = user.recipes.build
#     2.times { recipe.ingredients.build }
#     # self.errors = {}
#   end
#
#   def ingredients
#     params[:ingredients].each do |ingredient|
#       recipe.ingredients.build(ingrdient).tap(&valid?)
#       # recipe.ingredients.build(ingredient).tap do |ingredient|
#       #   errors[:ingredients] = ingredient.errors unless ingredient.valid?
#       # end
#     end
#   end
#
#   def submit(params)
#     self.params = params
#     self.title = params[:title]
#     self.description = params[:description]
#     self.cooking_steps = params[:cooking_steps]
#     self.prep_time = params[:prep_time]
#     self.cooking_time = params[:cooking_time]
#     ingredients
#     if valid?
#       recipe.update!(params)
#       true
#     else
#       false
#     end
#   end
# end
