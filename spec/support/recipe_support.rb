module RecipeSupport
  def user_signs_in
    within 'header' do
      click_link 'Sign in'
    end
    fill_in 'user[email]', with: 'jan@example.com'
    fill_in 'user[password]', with: 'secretcode'
    click_button 'Sign in'
  end
end
