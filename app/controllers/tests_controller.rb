class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = current_company.tests
  end

  def show; end

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
      params.require(:test).permit(:name, :questions_count, :pass_count)
    end
end
