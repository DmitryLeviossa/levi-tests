class ApplicationController < ActionController::Base
  before_action :authenticate_company!, except: :user_matrix
  before_action :configure_permitted_parameters, if: :devise_controller?


  def user_matrix
    token = JWT.decode(params[:token], nil, false)[0]
    @member = Member.find_by(company_id: token['company_id'], id: token['member_id'])
    @company = Company.find_by(id: token['company_id'])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
