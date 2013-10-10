require 'spec_helper'

feature 'user adds a match to comment', %Q{
  As a user,
  I want to add a match,
  So that I can rate the match
} do

  let(:user){FactoryGirl.create(:user)}  
  
  scenario 'user enters valid information' do
    match = FactoryGirl.create(:match)

    sign_in_as(user)
    visit match_path(match)

   expect(page).to have_content(match.full_time)
   expect(page).to have_content(match.away_team)
   expect(page).to have_content(match.schedule_date)
  end
end
