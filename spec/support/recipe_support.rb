module RecipeSupport
  def user_signs_in
    within 'header' do
      click_link 'Sign in'
    end
    fill_in 'user[email]', with: 'jan@example.com'
    fill_in 'user[password]', with: 'secretcode'
    click_button 'Sign in'
  end

  def user_fills_in_new_recipe_form
    fill_in 'recipe[title]', with: 'Lasagna'
    fill_in 'recipe[description]', with: 'A wonderful Italian treat.'
    # click_link 'Add ingredient'
    # fill_in 'recipe[ingredients_attributes][0][quantity]', with: '1kg'
    # fill_in 'recipe[ingredients_attributes][0][name]', with: 'premium beef'
    # fill_in 'recipe[ingredients_attributes][0][prep_method]', with: 'minced'
    fill_in 'recipe[cooking_steps]', with: 'A whole load of steps my friend. Better call Garfield!'
    fill_in 'recipe[prep_time]', with: '20'
    fill_in 'recipe[cooking_time]', with: '90'
    click_button 'Save Recipe'
  end

  def user_fills_in_update_recipe_form
    fill_in 'recipe[title]', with: 'English Onion'
    click_button 'Save Recipe'
  end
end
