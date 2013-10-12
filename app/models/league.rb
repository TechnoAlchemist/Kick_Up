class League < ActiveRecord::Base
  has_many :clubs, 
    inverse_of: :league

  validates_presence_of :name
end
