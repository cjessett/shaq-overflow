class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes

  validate :username, presence: true
  validate :username, uniqueness: true
  validates :password_hash, length: { minimum: 2 }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

end
