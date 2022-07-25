Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :foods, :recipes, :inventories, except: :update

  scope module: 'public-recipes' do
    resources :recipes, only: [:index, :show]
  end

  scope module: 'shopping-list' do
    resources :inventories, only: [:index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
