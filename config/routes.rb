Rails.application.routes.draw do

  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  root 'home#top'
  get 'home/top'
  get 'home/about'

  devise_for :customers, controllers: {
  	sessions:      'customers/sessions',
  	passwords:     'customers/passwords',
  	registrations: 'customers/registrations'
  }

  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }

  get 'customers/goodbye'
  post 'customers/goodbye_customer'
  resources :customers, only: [ :show, :edit, :update ]
  resources :items, only: [ :index, :show, :create ]
  delete "/cart_items/empty", to:'cart_items#empty'
  resources :cart_items, only: [ :index, :update, :destroy, :create ]
  post 'orders/confirm'
  get 'orders/thanks'
  resources :orders, only: [ :new, :index, :show, :create  ]
  resources :addresses, except: [ :show, :new ]

  namespace :admin do
    root :to => 'home#top'
    get 'home/top'
    resources :customers, only: [ :index, :edit, :show, :update ]
    resources :items, except: [ :destroy ]
    resources :genres, only: [ :index, :edit, :create, :update ]
    resources :orders, only: [ :index, :show, :update ] do
      resources :order_items, only: [ :update ]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
