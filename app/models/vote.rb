class Vote < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :value, :user
  validate :value_is_plus_or_minus

  belongs_to :votable, polymorphic: true
  belongs_to :user

  def value_is_plus_or_minus
    if !value.abs == 1
      errors.add(:value, "must be 1 or -1")
    end
  end
end
