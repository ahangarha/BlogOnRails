Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show]
  end

  root to: 'users#index'
end
