class Club < ActiveRecord::Base
  has_many :matches, 
    inverse_of: :home_team,
    inverse_of: :away_team
    

  belongs_to :league,
    inverse_of: :club
  

  validates_presence_of :name 
end
