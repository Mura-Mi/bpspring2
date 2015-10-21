Rails.application.routes.draw do

  root 'home#index'
  resources :top_page, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  resources :events
  resources :places
  resources :event_reports, except: [:index]

end
