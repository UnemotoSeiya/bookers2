Rails.application.routes.draw do
  root to: "homes#top"
  get '/home/about', to: 'homes#about'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
