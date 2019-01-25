Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :personal_expenses, only: [:index,:show, :new, :edit] 
    resources :shared_wallets, only: [:index, :show, :new, :edit]
  end

  post '/users/:id/personal_expenses/new', to: 'personal_expenses#new'

  resources :personal_expenses, only: [:create, :update, :destroy]
  resources :shared_wallets, only: [:create, :update, :destroy]

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  # get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get '/logout', to: 'sessions#destroy', as: 'logout'

end
