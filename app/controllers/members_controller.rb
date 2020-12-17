class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy close_test]

  def index
    @members = current_company.members
  end

  def show; end

  def new
    @member = current_company.members.new
  end

  def edit; end

  def create
    @member = current_company.members.new(member_params)
    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  def close_test
    member_test = @member.member_tests.find_by(test_id: params[:test_id])
    if member_test.nil?
      @member.member_tests.create(test_id: params[:test_id], status: :passed)
    else
      member_test.update(status: :passed)
    end
    redirect_to @member, notice: 'Test was successfully closed.'
  end

  private

    def set_member
      @member = current_company.members.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :email, :member_group_id)
    end
end
