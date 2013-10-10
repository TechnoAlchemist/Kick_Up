require 'spec_helper'

describe Match do
  it {should belong_to :home_team}
  it {should belong_to :away_team}
  it {should have_valid(:schedule_date).when(Date.today)}
  it {should_not have_valid(:schedule_date).when("", nil)}
end

