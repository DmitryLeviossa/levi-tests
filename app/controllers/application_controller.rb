class ApplicationController < ActionController::Base
  before_action :authenticate_company!, except: :user_matrix
  before_action :configure_permitted_parameters, if: :devise_controller?


  def user_matrix
    @member = Member.find_by(token: params[:token])
    @company = @member.company
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
