class Question < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  belongs_to :user


  def points
    points = votes.sum(:value)
  end

  def username
    user.username
  end
end
