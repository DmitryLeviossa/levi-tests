class MemberTestsController < ApplicationController
  before_action :set_member_test, only: [:show, :edit, :update, :destroy, :pass_form_member, :pass, :print]

  def index
    @member_tests = current_company.member_tests
  end

  def show; end

  def new
    @member_test = MemberTest.new
  end

  def edit; end

  def create
    @member_test = MemberTest.new(member_test_params)
    if @member_test.save
      redirect_to @member_test, notice: 'Member test was successfully created.'
    else
      render :new
    end
  end

  def update
    if @member_test.update(member_test_params)
      redirect_to @member_test, notice: 'Member test was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @member_test.destroy
    redirect_to member_tests_url, notice: 'Member test was successfully destroyed.'
  end

  def pass_form; end

  def pass
  end

  def print
  end

  private
    def set_member_test
      @member_test = current_company.member_tests.find(params[:id])
    end

    def member_test_params
      params.require(:member_test).permit(:passed, :member_id, :test_id)
    end
end
