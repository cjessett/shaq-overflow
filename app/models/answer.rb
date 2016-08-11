class Answer < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :question

  def author
    user.username
  end

  def points
    votes.sum(:value)
  end
end
