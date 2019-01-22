Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :personal_expenses, only: [:index] 
  end
  resources :personal_expenses, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :shared_wallets, only: [:show, :create, :update]

end
