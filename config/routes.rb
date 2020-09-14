Rails.application.routes.draw do
  root to: 'member_tests#index'

  devise_for :companies

  resources :test_groups
  resources :tests
  resources :members
  resources :member_tests do
    member do
      get :pass_form
      post :pass
      get :regenerate
    end
  end
  resources :questions
end
