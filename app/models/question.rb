class Question < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  belongs_to :user

  def author
    user.username.capitalize
  end

  def points
    points = votes.sum(:value)
  end
end
