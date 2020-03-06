Rails.application.routes.draw do
  devise_for :companies
  root to: 'members#index'

  resources :tests
  resources :members
  resources :member_tests
end
