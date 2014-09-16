class Answer < ActiveRecord::Base
  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :question

  scope :favorite_answer, -> { where(favorite: true) }
end
