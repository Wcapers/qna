class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: %i[create]
  before_action :set_answer, only: %i[destroy]

  def create
     @answer = @question.answers.new(answer_params.merge(user: current_user))
    if @answer.save
      redirect_to @question, notice: t('.successful_create')
    else
      redirect_to @question, notice: t('.failure_create')
    end
  end

  def destroy
     question = @answer.question
     if current_user.author_of? @answer
       @answer.destroy
       redirect_to question, notice: t('.successful_destroy')
     else
       redirect_to question, alert: t('.failure_destroy')
     end
   end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
