Rails.application.routes.draw do
  root 'tops#index'
  get 'categories/index'
  devise_for :users
  resources :thread_lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
