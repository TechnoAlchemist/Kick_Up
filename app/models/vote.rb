class Vote < ActiveRecord::Base
   belongs_to :user,
    inverse_of: :votes

  belongs_to :match,
    inverse_of: :votes

  validates_numericality_of :value
  validate :valid_vote

    def valid_vote
    if value == 1 || value == -1 
      true
    else
      errors.add(:value, "Vote isn't 1 or -1.")
    end
  end
end
