require 'humanize'

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
    begin
      @quiz.submit_time = Time.now
      correct_answer = check_answer(params[:answers])
      @quiz.score = calculate_score(correct_answer, params[:answers].length)
      if @quiz.save
        respond_to do |format|
          format.json { render :json => {:status => "success", :data => {result: @quiz} } }
        end
      end
    rescue Exception => e
      respond_to do |format|
        format.json { render :json => {:status => "error", :data => e} }
      end
    end
  end

  private
  def quiz_params
    params.require(:quiz).permit(:email, :start_time, :score, :submit_time)
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end

  def is_numeric?(string)
    !!Kernel.Float(string) 
  rescue TypeError, ArgumentError
    false
  end

  def check_answer(answers)
    total_correct = 0
    answers.each do |item|
      question = Question.find(item[:id])
      if is_numeric?(question.answer) && !is_numeric?(item[:answer])
        question_answer = question.answer.to_i.humanize
      else
        question_answer = question.answer
      end
      if question_answer.downcase.gsub(/\s+/, '') == item[:answer].downcase.gsub(/\s+/, '')
        total_correct = total_correct + 1
      end
    end
    return total_correct
  end

  def calculate_score(correct, total)
    score = (100/total) * correct
    return score
  end
end
