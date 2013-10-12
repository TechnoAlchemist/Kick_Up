class Comment < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :comments
  belongs_to :match,
    inverse_of: :comments

  validates_length_of :body, { minimum: 10, maximum: 1000 }
end

