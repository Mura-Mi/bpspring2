Rails.application.routes.draw do
  root 'top_page#index'

  resources :events
end
