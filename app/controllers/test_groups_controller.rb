class TestGroupsController < ApplicationController
  before_action :set_test_group, only: %i[show edit update destroy]

  def index
    @test_groups = current_company.test_groups.order(:position)
  end
  
  def show; end

  def new
    @test_group = TestGroup.new
  end

  def edit; end 

  def create
    @test_group = current_company.test_groups.new(test_group_params)
    if @test_group.save
      redirect_to @test_group, notice: 'Test group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @test_group.update(test_group_params)
      redirect_to @test_group, notice: 'Test group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @test_group.destroy
    redirect_to test_groups_path, notice: 'Test group was successfully destroyed.'
  end

  private
  
    def set_test_group
      @test_group = current_company.test_groups.find(params[:id])
    end

    def test_group_params
      params.require(:test_group).permit(:name, :position, member_group_ids: [])
    end
end
