Rails.application.routes.draw do
  root 'home#top'
  get 'home/top'
  get 'home/about'
  get 'customer/goodbye'

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

  resources :customers, only: [ :show, :edit, :update ]
  resources :items, only: [ :index, :show, :create ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
