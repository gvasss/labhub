require "rails_helper"

RSpec.feature "Sign up", :type => :feature do
    let(:user) { build(:user) }
  
    scenario 'user navigates to sign up page and successfully signs up', js: true do
      user
      visit root_path
  
      # Click the navbar toggler first (if needed)
      find('.navbar-toggler', match: :first).click
      find('a.btn.btn-light', text: 'Signup').click
      
      fill_in 'user[name]', with: user.name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation
      find('.sign-up-button').click
  
      # Click the navbar toggler first (if needed)
      find('.navbar-toggler', match: :first).click
      # Check for successful login by looking for user-specific elements
      expect(page).to have_selector('a.btn.btn-light', text: 'Log out', visible: true)
      expect(page).to have_selector('a.btn.btn-light', text: 'Edit Profile', visible: true)
    end
  
end