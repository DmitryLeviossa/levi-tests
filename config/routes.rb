Rails.application.routes.draw do
  devise_for :companies
  root to: 'member_tests#index'

end
