require 'spec_helper'

describe Club do
  it { should have_many :matches}
  it { should belong_to :league}
  
  it {should have_valid(:name).when("Arsenal")}
  it {should_not have_valid(:name).when(nil, " ")}
end
