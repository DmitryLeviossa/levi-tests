class SettingsController < ApplicationController
  def index
  end

  def regenerate
    token = Devise.friendly_token
    current_company.update(authentication_token: token)
    render :index
  end

end
