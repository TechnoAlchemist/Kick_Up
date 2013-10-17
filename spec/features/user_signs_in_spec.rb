require 'spec_helper'

feature 'user signs in', %q{
As a user
I want to enter my account information
So I can brag about my club


} do
  


# Acceptance Criteria:
# *User is brought to a page where he needs to enter username and password or email address and password
# * The user is then brought to personalize homepage
  let(:user) {FactoryGirl.create(:user)}
  scenario 'user signs in' do
    sign_in_as(user)
    expect(page).to have_content("Signed in successfully.")
  
  end
end
