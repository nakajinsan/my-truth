Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: [:edit, :update, :destroy, :show]
  resources :groups, only: [:index, :new, :create, :edit, :update]do
    resources :photos, only: [:index, :new, :create, :show]
  end
end
    