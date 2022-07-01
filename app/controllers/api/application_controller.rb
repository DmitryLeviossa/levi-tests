class Api::ApplicationController < ActionController::API
  before_action :authenticate_company, if: -> { current_company.nil? }

  def ping; end

  private

  def authenticate_company
    render json: { error: "You are not authorized to access this resource. Verify that you are passing passing your token." }, status: :unauthorized
  end

  def current_company
    @current_conpany ||= Company.find_by(authentication_token: request.headers["X-Company-Token"])
  end
end
