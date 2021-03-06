Rails.application.routes.draw do
  root 'tops#index'
  get 'search' => 'tops#search'
  get '/categories/:id' => 'categories#show', as: :categories_show
  resources :category_names, only: [:new, :create]
  devise_for :users
  resources :thread_lists, only: [:index, :show, :new, :create] do
    resources :responses, only: [:index, :create]
  end
  get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
