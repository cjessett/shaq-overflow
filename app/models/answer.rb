class Answer < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :question


  def points
    votes.sum(:value)
  end

  def author
    user.username
  end
end
