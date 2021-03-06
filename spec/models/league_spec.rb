require 'spec_helper'

describe League do
  it { should have_many :clubs}
  it { should have_valid(:name).when("English Premier League")}
  it { should_not have_valid(:name).when("", nil)}
end
