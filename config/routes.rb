Rails.application.routes.draw do

  resources :events

  get  'events' => 'events#index'
  post 'events' => 'events#create'
  get  'events/new' => 'events#new'
  get  'events/:id' => 'events#show'
  # get  'events/:id/edit' => 'events#edit'
  # patch  'events/:id' => 'events#update'
  # put    'events/:id' => 'events#update'
  # delete 'events/:id' => 'events#destroy'
end
