class AnswersController < ApplicationController

  def show
  end

  def new
  end

  def create
    @answer = question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  private

  def answer
    @answer ||= params[:id] ? Answer.find(params[:id]) : question.answers.new(answer_params)
  end

  helper_method :answer

  def answer_params
    params.require(:answer).permit(:body)
  end

  def question
    @question ||= Question.find(params[:question_id]) 
  end

  helper_method :question

end