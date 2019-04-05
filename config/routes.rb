Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'

  root 'dogs#index'

  get 'contact_form/new'
  get 'contact_form/create'
  # devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'user/profile', to: 'devise/registrations#profile', as: :profile
    get '/users/:user_id', to: 'users#show', as: :showprofile
  end
  get 'index_dogs', controller: 'users', action: :index_dogs

  as :user do
    get 'index_dogs', :to => 'users#index_dogs', :as => :user_root
  end

  resources "contacts", only: [:new, :create]

  get 'legislation', to: 'pages#', as: :legislation
  get 'qui-sommes-nous', to: 'pages#', as: :quisommesnous
  get 'dogs', to: 'dogs#index2', as: :index_search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs do
    member do
      put "like", to: "dogs#upvote"
      put "dislike", to: "dogs#downvote"
    end
    resources :conversations do
      resources :messages, controller: 'conversation/messages'
    end
  end
end
