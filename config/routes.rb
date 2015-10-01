Rails.application.routes.draw do
  get 'home/index'

  root 'top_page#index'

  resources :home, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  resources :events
  resources :places
  resources :event_reports, except: [:index]
end
