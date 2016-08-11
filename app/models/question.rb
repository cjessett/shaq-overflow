class Question < ActiveRecord::Base

  has_many :votes, as: :votable
  has_many :answers
  belongs_to :user

  def username
    user.username
  end

  def points
    votes.sum(:value)
  end
end
