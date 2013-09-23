require 'spec_helper'

feature 'user signs up', %q{
  
  As a user
  I want to create an account
  So that I brag about my club

} do 
# Acceptance Criteria:
# * User provides email for updates
# * User provides password
# * User verifies password
  

  scenario 'user signs up with valid info' do
    visit new_user_registration_path
    email = "gabe@example.com"
    pass = 'gabegabe'
    fill_in "Email", with: email
    fill_in "user_password", with: pass
    fill_in "user_password_confirmation", with: pass
    click_on "Register"

    expect(page).to have_content 'Welcome football fanatic!'
    expect(User.find_by(email: email)).to be_present
  end
end
