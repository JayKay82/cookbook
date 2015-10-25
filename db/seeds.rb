# Generate a user
user = User.new(
  name: 'Jan',
  email: 'jankroezen@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
user.skip_confirmation!
user.save!

# Generate recipes
50.times do
  Recipe.create!(
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    cooking_steps: Faker::Lorem.paragraph,
    prep_time: Faker::Number.number(2),
    cooking_time: Faker::Number.number(2),
    user: user
  )
end
recipes = Recipe.all

# Generate ingredients
200.times do
  Ingredient.create!(
    name: Faker::Lorem.word,
    quantity: Faker::Number.number(1),
    prep_method: Faker::Lorem.word,
    recipe: recipes.sample
  )
end

# Generator data
puts "#{User.count} user created."
puts "#{Recipe.count} recipes created."
puts "#{Ingredient.count} ingredients created."
