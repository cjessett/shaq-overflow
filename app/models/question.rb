class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes, as: :votable
  has_many :answers
  belongs_to :user

  def username
    return user.username
  end

  def points
    votes.sum(:value)
  end
end
