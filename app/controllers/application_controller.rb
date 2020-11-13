class ApplicationController < ActionController::Base
  before_action :authenticate_company!, except: %i[user_matrix public_test]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_matrix
    begin
      @member = Member.find_by(token: params[:token])
      @company = @member.company
    rescue
      redirect_to root_path
    end
  end

  def public_test
    begin
      token = JWT.decode(params[:token], Rails.configuration.JWT_SECRET)[0]
      
      @member_test = MemberTest.find(token['id'])
      @company = @member_test.member.company
      
      unless @member_test.started?
        redirect_to root_path
      end
    rescue
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
