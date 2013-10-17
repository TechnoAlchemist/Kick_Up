class Match < ActiveRecord::Base

  belongs_to :home_team,
    class_name: 'Club',
    inverse_of: :matches

  belongs_to :away_team,
    class_name: 'Club',
    inverse_of: :matches

  has_many :comments,
    inverse_of: :match

  has_many :votes, 
    inverse_of: :match

  validates_presence_of :schedule_date
  validates_numericality_of :vote_count
  validates_numericality_of :ranking

  def self.rankings
    (1..5).to_a
  end

  def total_rank
    votes.pluck(:value).reduce(:+)
  end



end
