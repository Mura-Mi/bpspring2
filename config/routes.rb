Rails.application.routes.draw do

  post 'attendance_plan/create'
  post 'attendance_plan/delete'

  root 'home#index'
  resources :top_page, only: [:index]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  resources :events
  resources :places
  resources :event_reports, except: [:index]

end
