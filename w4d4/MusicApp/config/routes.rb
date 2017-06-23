Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :bands
  resources :albums, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :tracks, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :notes, only: [:create, :destroy]

end
