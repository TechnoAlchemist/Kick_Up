FactoryGirl.define do
  factory :user do
    username 'arsenalfan'
    email  'user@example.com'
    password 'gabegabe'
  end

  factory :match do
    home_team_id 1 
    away_team_id 2
    schedule_date Date.today
    half_time '0-0'
    full_time '3-0'
    ranking 4
  end

  factory :club do
    name "Arsenal"
    location "London"
    league_id 1
  end
end


