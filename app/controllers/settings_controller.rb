class SettingsController < ApplicationController
  def index
  end

  def regenerate
    current_company.update(authentication_token: generate_new_token)
    render :index
  end

  private

  def generate_new_token
    Devise.friendly_token
  end
end
