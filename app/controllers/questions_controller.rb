class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def get_all
    @questions = current_user.questions
    respond_to do |format|
      format.json { render json: @questions }
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
      @question.user = current_user
      if @question.save!
        redirect_to questions_path
      else
        render 'new'
      end
  end

  private
  def question_params
    params.require(:question).permit(:text, :question_type, :answer, :answer_option_a, :answer_option_b, :answer_option_c, :answer_option_d, :user_id)
  end

end
