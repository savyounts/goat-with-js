Rails.application.routes.draw do
  resources :trips, only: [:show, :new, :edit, :update, :destroy, :create]
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:create]
  resources :plans, only: [:create, :destroy]

  resources :destinations do
    resources :plans, only: [:new]
  end


  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', :to => 'sessions#create'


  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
