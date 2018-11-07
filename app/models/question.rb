class Question < ApplicationRecord
  validates :text, presence: true
  validates :answer, presence: true
  validates :question_type, presence: true

  belongs_to :user
  scope :random_except_email, ->(email) {joins(:user).where.not(users: {email: email}).order("RAND()").limit(20)}
end
