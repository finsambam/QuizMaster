class Question < ApplicationRecord
  validates :text, presence: true
  validates :answer, presence: true

  belongs_to :user
end
