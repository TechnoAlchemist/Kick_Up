require 'spec_helper'

describe Match do
  it {should belong_to :home_team}
  it {should belong_to :away_team}
  it {should have_many :votes}
  it {should have_many :comments}

  it {should have_valid(:schedule_date).when(Date.today)}
  it {should_not have_valid(:schedule_date).when("", nil)}

    
  it {should have_valid(:ranking).when(5)}
  it {should_not have_valid(:ranking).when(nil, "", "stuff")}

  it {should have_valid(:vote_count).when(0, 250, -75)}
  it {should_not have_valid(:vote_count).when(nil, "", "stuff")}
end

