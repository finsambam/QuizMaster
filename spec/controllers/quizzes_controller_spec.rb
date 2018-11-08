require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  describe "#new" do
    it "responds successfully" do
      get :new
      expect(response).to be_success
    end

    it "returns a 200 response" do
      get :new
      expect(response).to have_http_status "200"
    end
  end

  describe "create" do
    before do
      @quizzes = Quiz.all
    end

    context "using valid attributes" do
      it "should add a quiz" do
        quiz_params = FactoryBot.attributes_for(:quiz)
        expect {
          post :create, params: { quiz: quiz_params }
        }.to change(@quizzes, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "shouldn't to add a quiz" do
        quiz_params = FactoryBot.attributes_for(:quiz, :invalid)
        expect {
          post :create, params: { quiz: quiz_params }
        }.to_not change(@quizzes, :count)
      end
    end
  end
end
