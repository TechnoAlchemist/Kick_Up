class Club < ActiveRecord::Base
  has_many :matches, 
    inverse_of: :club
    

  belongs_to :league,
    inverse_of: :club
  

  validates_presence_of :name 
end
