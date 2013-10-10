require 'spec_helper'

describe Match do
  it {should belong_to :home_team}
  it {should belong_to :away_team}
  it {should have_valid(:home_team_id).when("Arsenal, Aston Villa")}
  it {should have_valid(:away_team_id).when("Tottenham Hotspur, Manchester United")}
  it {should_not have_valid(:home_team).when(" ", nil)}
  it {should_not have_valid(:away_team).when(" ", nil)}
  it {should have_valid(:schedule_date).when(Date.today)}
end
