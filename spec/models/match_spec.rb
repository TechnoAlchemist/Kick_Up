require 'spec_helper'

describe Match do
  it {should belong_to :club}
  it {should have_valid(:home_team).when("Arsenal, Aston Villa")}
  it {should have_valid(:away_team).when("Tottenham Hotspur, Manchester United")}
  it {should_not have_valid(:home_team).when(" ", 3)}
  it {should_not have_valid(:away_team).when(" ", 9)}
  it {should have_valid(:schedule_date).when(Date.today)}
end
