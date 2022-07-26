Rails.application.routes.draw do
  # get 'recipe/index'
  # get 'recipe/show'
  # get 'recipe/new'
  # get 'recipe/create'
  # get 'recipe/destroy'
  # get 'inventory/index'
  # get 'inventory/show'
  # get 'inventory/new'
  # get 'inventory/create'
  # get 'inventory/destroy'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :foods, :recipes, :inventories, except: :update
  get "public_recipes", to: "home#public_recipes"

  # scope module: 'public-recipes' do
  #   resources :recipes, only: [:index, :show]
  # end

  # scope module: 'shopping-list' do
  #   resources :inventories, only: [:index]
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
