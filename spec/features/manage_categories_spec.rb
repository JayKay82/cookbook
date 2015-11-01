require 'rails_helper'

RSpec.feature "Manage Recipes CRUD:", type: :feature do
  include RecipeSupport

  before do
    @user = create(:user, :confirmed, :admin)
    @recipe1 = create(:recipe, user: @user)
    @recipe2 = create(:recipe, title: 'Cheese Burger', user: @user)
    visit root_path
    user_signs_in
  end

  scenario "Admin can add a new category", js: true do
    click_link 'Categories'
    fill_in 'category[name]', with: 'appetizer'
    click_button 'add'

    expect(page).to have_content('appetizer')
  end

end
