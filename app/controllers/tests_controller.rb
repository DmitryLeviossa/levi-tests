class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  def index
    @tests = current_company.tests.joins(:test_group).order('test_groups.name, tests.module')
  end

  def show
    @new_question = @test.questions.new
    4.times { @new_question.answers.new }
  end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_company.tests.new(test_params)
    if @test.save
      redirect_to @test, notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  private

    def set_test
      @test = current_company.tests.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:name, :questions_count, :pass_count, :test_group_id, :module, :value, :description)
    end
end
