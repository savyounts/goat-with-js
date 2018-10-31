Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :plans, only: [:create, :destroy]
  resources :trips, only: [:create, :update, :destroy]


  resources :comments, only: [:create, :update] do
      member do
      post 'like'
      post 'dislike'
    end
  end

  resources :users, only: [:new, :show, :create] do
    resources :trips, only: [:edit, :new, :destroy]
    resources :destinations, only: [:index]
  end

  resources :destinations do
    resources :plans, only: [:new]
    resources :comments, only: [:new, :edit]
  end


  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  # get 'comments/:comment_id/like', to: 'comments#like', as: :like

  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
