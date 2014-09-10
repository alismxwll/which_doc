class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, presence: true
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  has_many :questions
  has_many :answers

  has_secure_password
end
