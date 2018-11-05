require 'rails_helper'

RSpec.describe Question, type: :model do
    let(:user) { FactoryBot.create(:user) }

  it "is valid with a user, question, question type and answer" do
    question = Question.new(
      user: user,
      text: "2+2",
      question_type: "essay",
      answer: "4"
    )
    expect(question).to be_valid
  end

  it "is invalid without a user" do
    question = Question.new(user: nil)
    question.valid?
    expect(question.errors[:user]).to include("must exist")
  end

  it "is invalid without a question" do
    question = Question.new(text: nil)
    question.valid?
    expect(question.errors[:text]).to include("can't be blank")
  end

  it "is invalid without a answer" do
    question = Question.new(answer: nil)
    question.valid?
    expect(question.errors[:answer]).to include("can't be blank")
  end

  it "is invalid without a question_type" do
    question = Question.new(question_type: nil)
    question.valid?
    expect(question.errors[:question_type]).to include("can't be blank")
  end
end
