class ParamsSanitizer
  # This method takes in the POST parameters and iterates over them deleting
  # ingredients where '_destroy' is set to '1'. When creating the new recipe
  # it makes sure that any ingredients that were removed on the form are
  # actually not saved along with the recipe.
  def self.sanitize_destroyed(parameters)
    parameters['ingredients_attributes'].each do |ingredient|
      if ingredient[1]['_destroy'] == '1'
        parameters['ingredients_attributes'].delete(ingredient[0])
      end
    end
    parameters
  end
end
