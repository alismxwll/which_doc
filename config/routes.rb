Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :users
  resources :questions

end
