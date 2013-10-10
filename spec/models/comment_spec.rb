require 'spec_helper'

describe Comment do
  it { should have_valid(:body).when("I fucking hate Chelsea FC")}
  it { should_not have_valid(:body).when("", nil, "short")}
  
  it { should belong_to :user}
  it { should belong_to :match}
end
