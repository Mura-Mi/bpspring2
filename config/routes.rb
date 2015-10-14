Rails.application.routes.draw do
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
  
  get 'home/index' => "home#index"

end
