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
end
