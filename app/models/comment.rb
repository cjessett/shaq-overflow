class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
