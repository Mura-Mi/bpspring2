Rails.application.routes.draw do
  # get 'events/index'

  get 'events/:id' => 'events#show'

  # get 'events/create'

end
