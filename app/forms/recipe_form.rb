# class RecipeForm < Reform::Form
#   # Recipe properties and validations
#   property :title
#   validates :title, presence: true, length: { in: 2..20 }
#   property :description
#   validates :description, presence: true, length: { maximum: 140 }
#   property :cooking_steps
#   validates :cooking_steps, presence: true
#   property :prep_time
#   validates :prep_time, presence: true, numericality: { only_integer: true }
#   property :cooking_time
#   validates :cooking_time, presence: true, numericality: { only_integer: true }
#
#   # Ingredients properties and validations
#   collection :ingredients, populate_if_empty: Ingredient do
#     property :quantity
#     property :name
#     validates :name, presence: true
#     property :prep_method
#   end
# end
