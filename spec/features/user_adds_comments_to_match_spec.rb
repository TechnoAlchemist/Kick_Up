require 'spec_helper'

feature 'user comments on a match', %Q{
  As a Arsenal fan,
  I want to comment on a match,
  So that I can troll Chelsea supporters 
} do

  let(:user){FactoryGirl.create(:user)}
  let(:match) { FactoryGirl.create(:match)}

  scenario "user comments on a match" do
    sign_in_as(user)
    visit match_path(match)
    click_on "Add Comment"
    fill_in "Comment", with: "Manchester city would still be a mid table team without corrupt oil money"
    click_on "Submit Comment"
    expect(page).to have_content("Manchester city would still be a mid table team without corrupt oil money")

    new_comment = Comment.last
    expect(new_comment.match_id).to eql(match.id)
  end

  scenario "user submits without adding a comment" do
    sign_in_as(user)
    visit match_path(match)
    click_on "Add Comment"
    fill_in "Comment", with: ""
    click_on "Submit Comment"
    expect(page).to have_enter("You must write an entry before submitting comments")
    
  end
end
