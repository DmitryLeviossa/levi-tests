class Api::MatrixController < Api::ApplicationController
  before_action :check_email

  def index
    render json: member.matrix
  end

  private

  def member
    @member ||= current_company.members.find_by(email: params[:email])
  end

  def check_email
    return render json: {message: 'No email provided'}, status: 422 if params[:email].nil?
    return render json: {message: 'No member with such email'}, status: 404 if member.nil?
  end

end