require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it "is valid with a email and start_time" do
    quiz = Quiz.new(
      email: "test@example.com",
      start_time: Time.now
    )
    expect(quiz).to be_valid
  end

  it "is invalid without a email" do
    quiz = Quiz.new(email: nil)
    quiz.valid?
    expect(quiz.errors[:email]).to include("can't be blank")
  end
end
