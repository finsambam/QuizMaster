class Question < ApplicationRecord
  validates :text, presence: true
  validates :answer, presence: true
  validates :question_type, presence: true

  belongs_to :user
end
