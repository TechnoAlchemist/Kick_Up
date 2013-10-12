require 'spec_helper'

feature 'user comments on a match', %Q{
  As a Arsenal fan,
  I want to comment on a match,
  So that I can troll Chelsea supporters 
} do

  let(:user){FactoryGirl.create(:user)}
  # create 2 clubs
  # in your match specify the home and away teams to be those clubs
  let!(:club1){FactoryGirl.create(:club, name: "Arsenal")}
  let!(:club2){FactoryGirl.create(:club, name: "Swansea")}
  let!(:match) { FactoryGirl.create(:match, home_team: club1, away_team: club2)}

  scenario "user comments on a match" do
    sign_in_as(user)
    visit match_path(match)
    fill_in "Body", with: "Manchester city would still be a mid table team without corrupt oil money"
    click_on "Submit Comment"
    expect(page).to have_content("Manchester city would still be a mid table team without corrupt oil money")
  end


  scenario "user submits without adding a comment" do
    sign_in_as(user)
    visit match_path(match)
    fill_in "Body", with: ""
    click_on "Submit Comment"
    expect(page).to have_content("You must write an entry before submitting comments")  
  end
end
