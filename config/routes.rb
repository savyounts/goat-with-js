Rails.application.routes.draw do
  resources :trips, only: [:new, :edit, :update, :destroy, :create]
  resources :destinations
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:create]


  get   '/login', :to => 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', :to => 'sessions#create'


  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
