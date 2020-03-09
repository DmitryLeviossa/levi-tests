Rails.application.routes.draw do
  root to: 'member_tests#index'

  devise_for :companies

  resources :tests
  resources :members
  resources :member_tests do
    member do
      get :print
      get :pass_form
      post :pass
      get :regenerate
    end
  end
  resources :questions
end
