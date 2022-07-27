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

  resources :foods, except: :update

  resources :recipes, except: :update do
    get "new_shopping_list", to: "recipes#new_shopping_list"
    resources :recipe_foods, only: [:create, :destroy, :new]
  end

  resources :inventories, except: :update do
    resources :inventory_foods, only: [:create, :destroy, :new]
  end

  get "public_recipes", to: "home#public_recipes"
  post "shopping_list", to: "home#shopping_list"
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
