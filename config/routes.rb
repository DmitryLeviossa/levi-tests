Rails.application.routes.draw do
  resources :questions
  devise_for :companies
  root to: 'members#index'

  resources :tests
  resources :members
  resources :member_tests
end
