Rails.application.routes.draw do
  devise_for :user
  #####################
  #####################
  get 'legislation', to: 'pages#', as: :legislation
  get 'contact', to: 'pages#', as: :contact
  get 'qui-sommes-nous', to: 'pages#', as: :quisommesnous

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :dogs do 
 	resources :bookings, only: [ :new, :create, :show]
  end
end
