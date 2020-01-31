Rails.application.routes.draw do
  root 'tops#index'
  get 'search' => 'tops#search'
  get 'categories/index'
  get '/categories/:id' => 'categories#show', as: :categories_show
  resources :category_names
  devise_for :users
  resources :thread_lists do
    resources :responses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
