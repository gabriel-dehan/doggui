Rails.application.routes.draw do
devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
 get 'user/profile', to: 'devise/registrations#profile', as: :profile
end



  root 'dogs#index'
  #####################
  #####################
  get 'legislation', to: 'pages#', as: :legislation
  get 'contact', to: 'pages#', as: :contact
  get 'qui-sommes-nous', to: 'pages#', as: :quisommesnous
  get 'index2', to: 'dogs#index2', as: :index_search
  
  get 'user/reviews' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :dogs do 
 	resources :bookings, only: [:new, :create, :show] do 
    resources :reviews, only: [:new, :create, :show]
  
  end
  end
end
