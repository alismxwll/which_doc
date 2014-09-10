Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :users
  resources :sessions
  resources :questions
  resources :answers
end
