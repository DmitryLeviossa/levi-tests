class MemberGroupsController < ApplicationController
  before_action :set_member_group, only: %i[show edit update destroy]

  def index
    @member_groups = current_company.member_groups
  end

  def show; end

  def new
    @member_group = MemberGroup.new
  end

  def edit; end

  def create
    @member_group = current_company.member_groups.new(member_group_params)
    if @member_group.save
      redirect_to @member_group, notice: 'Member group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @member_group.update(member_group_params)
      redirect_to @member_group, notice:  'Member group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @member_group.destroy
    redirect_to member_groups_path, notice: 'Member group was successfully deleted.'
  end

  private
    def set_member_group
      @member_group = MemberGroup.find(params[:id])
    end

    def member_group_params
      params.require(:member_group).permit(:name, test_group_ids: [])
    end
end
