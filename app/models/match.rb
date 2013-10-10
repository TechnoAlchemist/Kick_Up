class Match < ActiveRecord::Base

  belongs_to :home_team,
    class_name: 'Club'

  belongs_to :away_team,
    class_name: 'Club'

  validates_presence_of :schedule_date



end
