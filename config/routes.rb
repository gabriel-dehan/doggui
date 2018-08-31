
Rails.application.routes.draw do
devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
 get 'user/profile', to: 'devise/registrations#profile', as: :profile
 get '/users',   to: 'users#index',   via: 'get'
 get '/users/:user_id', to: 'users#show', as: :showprofile
end

  root 'dogs#index'
  get 'legislation', to: 'pages#', as: :legislation
  get 'contact', to: 'pages#', as: :contact
  get 'qui-sommes-nous', to: 'pages#', as: :quisommesnous
  get 'index2', to: 'dogs#index2', as: :index_search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :dogs do
  member do
    put "like", to: "dogs#upvote"
    put "dislike", to: "dogs#downvote"
  end
  resources :reviews, only: [:new, :show, :index] do
    post 'reviews', to: 'reviews#create', as: :create_review
 	end
  resources :bookings, only: [:new, :create, :show] do
  end

end

end

