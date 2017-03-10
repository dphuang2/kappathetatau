Rails.application.routes.draw do
  # Not sure why I need to skip the sessions controller but it fixed duplicate routes
  devise_for :users, skip: [:registrations, :sessions]
  devise_for :users, controllers: {
    registrations: 'my_devise/registrations'
  }
  resources :users
end
