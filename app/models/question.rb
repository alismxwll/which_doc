class Question < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true
  validates :title, presence: true
  has_many :answers
end
