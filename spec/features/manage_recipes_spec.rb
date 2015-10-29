require 'rails_helper'

RSpec.feature "Manage Recipes CRUD:", type: :feature do
  include RecipeSupport

  before do
    @user = create(:user, :confirmed)
    @recipe1 = create(:recipe, user: @user)
    @recipe2 = create(:recipe, title: 'Cheese Burger', user: @user)
    visit root_path
    user_signs_in
  end

  scenario 'User signs in and sees a list of recipes' do
    expect(page).to have_content(@recipe1.title)
    expect(page).to have_content(@recipe2.title)
  end

  scenario 'User clicks on a recipes title to see the recipe show page' do
    click_link @recipe1.title

    expect(page).to have_content(@recipe1.title)
    expect(page).to have_content(@recipe1.cooking_steps)
  end

  scenario 'User creates a new recipes', js: true do
    click_link 'New Recipe'
    user_fills_in_new_recipe_form

    expect(page).to have_content('Great! Recipe was successfully added.')
    expect(page).to have_content('Lasagna')
  end

  scenario 'User updates a recipes', js: true do
    click_link 'French Onion'
    click_link 'edit'
    user_fills_in_update_recipe_form

    expect(page).to have_content('Successfully changed recipe.')
    expect(page).to have_content('English Onion')
  end

  scenario 'User deletes a recipe' do
    click_link 'Cheese Burger'
    click_link 'delete'

    expect(page).to have_content('The recipe was successfully deleted.')
  end
end
