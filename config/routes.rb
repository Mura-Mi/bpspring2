Rails.application.routes.draw do

  resources :interests
  post 'attendance_plan/create'
  post 'attendance_plan/delete'

  root 'home#index'
  resources :top_page, only: [:index]

  resources :event_photos, only: [:update]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  resources :events
  resources :places
  resources :event_reports

end
