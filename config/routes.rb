Rails.application.routes.draw do
  devise_for :users
  root 'top_page#index'

  resources :events
  resources :places
  resources :event_reports, except: [:index]
end
