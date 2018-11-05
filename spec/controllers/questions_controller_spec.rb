require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	describe "index" do
    context "as an user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "should return a 200 response" do
        sign_in @user
        get :index
        aggregate_failures do
          expect(response).to be_success
          expect(response).to have_http_status "200"
        end
      end
    end

    context "as a guest" do
      it "should return a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "should redirect to the log-in page" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "create" do
    context "as an user" do
      before do
        @user = FactoryBot.create(:user)
      end

      context "using valid attributes" do
        it "should add a question" do
          question_params = FactoryBot.attributes_for(:question)
          sign_in @user
          expect {
            post :create, params: { question: question_params }
          }.to change(@user.questions, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "shouldn't to add a question" do
          question_params = FactoryBot.attributes_for(:question, :invalid)
          sign_in @user
          expect {
            post :create, params: { question: question_params }
          }.to_not change(@user.questions, :count)
        end
      end
    end

    context "as a guest" do
      it "should return a 302 response" do
        question_params = FactoryBot.attributes_for(:question)
        post :create, params: { question: question_params }
        expect(response).to have_http_status "302"
      end

      it "should redirect to log-in page" do
        question_params = FactoryBot.attributes_for(:question)
        post :create, params: { question: question_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "update" do
    context "as an user" do
      before do
        @user = FactoryBot.create(:user)
        @question = FactoryBot.create(:question, user: @user)
      end

      it "should update a question" do
        question_params = FactoryBot.attributes_for(:question,
          text: "2 + 3?")
        sign_in @user
        patch :update, params: { id: @question.id, question: question_params }
        expect(@question.reload.text).to eq "2 + 3?"
      end
    end

    context "as a guest" do
      before do
        @question = FactoryBot.create(:question)
      end

      it "should return a 302 response" do
        question_params = FactoryBot.attributes_for(:question)
        patch :update, params: { id: @question.id, question: question_params }
        expect(response).to have_http_status "302"
      end

      it "should redirect to log-in page" do
        question_params = FactoryBot.attributes_for(:question)
        patch :update, params: { id: @question.id, question: question_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#destroy" do
    context "as an user" do
      before do
        @user = FactoryBot.create(:user)
        @question = FactoryBot.create(:question, user: @user)
      end

      it "should delete a project" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @question.id }
        }.to change(@user.questions, :count).by(-1)
      end
    end

    context "as a guest" do
      before do
        @question = FactoryBot.create(:question)
      end

      it "should return a 302 response" do
        delete :destroy, params: { id: @question.id }
        expect(response).to have_http_status "302"
      end

      it "should redirect to the log-in page" do
        delete :destroy, params: { id: @question.id }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
