require "rails_helper"

RSpec.feature "Logout", :type => :feature do
  let(:user) { create(:user) }

  scenario 'user successfully logs out', js: true do
    #signin
    user
    visit root_path
    find('.navbar-toggler', match: :first).click
    find('a.btn.btn-light', text: 'Login').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login-button').click
    if page.has_content?('Invalid Email or password.')
      puts "Login failed: Invalid Email or password."
    end

    # Click the navbar toggler first (if needed)
    find('.navbar-toggler', match: :first).click
    find('a.btn.btn-light', text: 'Log out').click

    # Click the navbar toggler first (if needed)
    find('.navbar-toggler', match: :first).click
    # Check for successful login by looking for user-specific elements
    expect(page).to have_selector('a.btn.btn-light', text: 'Login', visible: true)
    expect(page).to have_selector('a.btn.btn-light', text: 'Signup', visible: true)
  end

end