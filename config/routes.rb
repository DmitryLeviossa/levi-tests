Rails.application.routes.draw do
  root to: 'member_tests#index'

  get '/user_matrix', to: 'application#user_matrix'
  get '/public_test', to: 'application#public_test'

  devise_for :companies
  namespace :api do
    get :ping, controller: 'application'
    resources :matrix, only: :index
  end

  resources :settings, only: :index do
    get :regenerate, on: :collection
  end
  
  resources :test_groups
  resources :tests
  resources :members do
    member do
      get :close_test
    end    
  end
  resources :member_groups
  resources :member_tests do
    member do
      get :history
      get :pass_form
      post :pass
      get :regenerate
    end
  end
  resources :questions
end
