class MemberTestsController < ApplicationController
  before_action :set_member_test, only: [:show, :edit, :update, :destroy, :pass_form, :pass, :regenerate]
  before_action :validate_regeneration, only: [:regenerate]

  def index
    @status_filter = MemberTest.statuses.keys.include?(params[:status]) ? params[:status] : 'passed'
    @member_tests = current_company.member_tests.where(status: @status_filter).eager_load(:member, test: :test_group).order('members.name, test_groups.name, tests.module')
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice No. #{@member_test.id}",
        page_size: 'A4',
        template: "member_tests/pdf.slim",
        encoding: "utf8",
        layout: "pdf.html",
        orientation: "Portrait",
        margin: { left: 0, right: 0 },
        header: { html: { template: "layouts/pdf_header.slim" }, spacing: 20 }, 
        footer: { html: { template: "layouts/pdf_footer.slim" } }, 
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

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

  def pass_form
    @member_test.update(status: 'started') if @member_test.draft?
  end

  def pass
    if @member_test.update(pass_params)
      redirect_to @member_test, notice: 'Member test was completed.'
    else
      render :pass_form
    end
  end

  private
    def set_member_test
      @member_test = current_company.member_tests.find(params[:id])
    end

    def member_test_params
      params.require(:member_test).permit(:passed, :member_id, :test_id)
    end

    def pass_params
      params.require(:member_test).permit(member_test_questions_attributes: [:id, :answer_id])
    end

    def validate_regeneration
      set_member_test
      redirect_back fallback_location: root_path, notice: 'Cannot regenerate started tests' if @member_test.started?
    end
end
