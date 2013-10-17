require 'spec_helper'

feature 'user rates a match', %Q{
  As a football fan,
  I want to rate a match,
  So that I can gush how awesome it was 
} do

    # AC
    # User signs in
    # User is given an option select nth stars out of 5 stars
    # Each review has the option to upvote and/or downvote
    # I can only upvote or downvote once per review
    # I can change my vote from upvote to downvote and vice versa. 
  let!(:user) {FactoryGirl.create(:user)}
  let!(:club1){FactoryGirl.create(:club, name: "Arsenal")}
  let!(:club2){FactoryGirl.create(:club, name: "Swansea")}
  let!(:match) { FactoryGirl.create(:match, home_team: club1, away_team: club2)}

    scenario "user makes a valid upvote" do
    sign_in_as(user)
    visit match_path(match)
   

    within "#upvote" do
      click_on "+"
    end
      
    vote = Vote.last
    expect(vote.value).to eql(1)
    expect(match.total_rank).to eql(1)
  end 

  scenario "user makes a valid downvote" do
    sign_in_as(user)
    visit match_path(match)


    within "#downvote" do
      click_on "-"
    end

    vote = Vote.last
    expect(vote.value).to eql(-1)
    expect(match.total_rank).to eql(-1)
  end

   scenario "user can only make one vote" do
    sign_in_as(user)
    visit match_path(match)


    within "#downvote" do
      click_on "-"
    end

    within "#downvote" do
      click_on "-"
    end

    expect(match.total_rank).to eql(-1)   
  end
end
