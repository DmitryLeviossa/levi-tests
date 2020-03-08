class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def edit; end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question.test, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question.test, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    test = @question.test
    @question.destroy
    redirect_to test, notice: 'Question was successfully destroyed.'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:text, :test_id, answers_attributes: [:id, :_destroy, :text, :is_right])
    end
end
