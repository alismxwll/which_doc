class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, presence: true
end
