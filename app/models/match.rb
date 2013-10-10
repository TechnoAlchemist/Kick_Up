class Match < ActiveRecord::Base

  belongs_to :home_team,
    class_name: 'Club',
    inverse_of: :matches

  belongs_to :away_team,
    class_name: 'Club',
    inverse_of: :matches

  validates_presence_of :schedule_date



end
