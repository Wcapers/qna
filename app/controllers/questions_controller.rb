class QuestionsController < ApplicationController
    before_action :set_question, only: %i[show]

    def index
      @questions = Question.all
    end

    def show
    end

    def new
    end

    def create
      @question = Question.new(question_params)

      if @question.save
        redirect_to @question
      else
        render :new
      end
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    helper_method :question

    def question_params
      params.require(:question).permit(:title, :body)
    end
end
