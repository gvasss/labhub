require "rails_helper"

RSpec.feature "Login", :type => :feature do
  let(:user) { create(:user) }

  scenario 'user navigates to the login page and succesfully logs in', js: true do
    user
    visit root_path

    # Click the navbar toggler first (if needed)
    find('.navbar-toggler', match: :first).click

    # Now the "Login" link should be visible
    find('a.btn.btn-light', text: 'Login').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login-button').click

    # Check for error messages
    if page.has_content?('Invalid Email or password.')
      puts "Login failed: Invalid Email or password."
    end

    # Click the navbar toggler first (if needed)
    find('.navbar-toggler', match: :first).click
    # Check for successful login by looking for user-specific elements
    expect(page).to have_selector('a.btn.btn-light', text: 'Log out', visible: true)
    expect(page).to have_selector('a.btn.btn-light', text: 'Edit Profile', visible: true)
  end

end