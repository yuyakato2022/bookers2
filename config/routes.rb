Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users
  get '/home/about' => 'homes#about', as:'about'
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :create, :update]

end
