class QuizzesController < ApplicationController
	before_action :find_quiz, only: [:do_quiz, :submit_quiz]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.start_time = Time.now
    if @quiz.save
      redirect_to do_quiz_path(:id => @quiz.id)
    else
      render "new"
    end
  end

  def do_quiz
    @questions = Question.random_except_email(@quiz.email)
  end

  def submit_quiz
  	correct answer = check_answer(params[:answers])
  end

  private
  def quiz_params
    params.require(:quiz).permit(:email, :start_time, :score, :submit_time)
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end

  def check_answer(answers)
  	correct_answer = 0
  	answers.each do |answer|
  		byebug
  		item = answer
  	end
  end
end
