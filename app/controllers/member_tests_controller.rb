class MemberTestsController < ApplicationController
  before_action :set_member_test, only: [:show, :edit, :update, :destroy, :pass_form_member, :pass, :print, :regenerate]

  def index
    @member_tests = current_company.member_tests
  end

  def show; end

  def new
    @member_test = MemberTest.new
  end

  def create
    @member_test = current_company.member_tests.new(member_test_params)
    if @member_test.save
      redirect_to @member_test, notice: 'Member test was successfully created.'
    else
      render :new
    end
  end

  def regenerate
    @member_test.regerenate!
    redirect_to @member_test, notice: 'Member test was successfully regenerated.'
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
