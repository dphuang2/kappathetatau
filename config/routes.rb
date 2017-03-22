Rails.application.routes.draw do
  # Not sure why I need to skip the sessions controller but it fixed duplicate routes
  devise_for :users, skip: [:registrations, :sessions]
  devise_for :users, controllers: {
    registrations: 'my_devise/registrations'
  }
  resources :users
  get '/resumes', to: 'resumes#index'
  get '/edit', to: 'resumes#edit'
  get '/download', to: 'resumes#download'
  post '/upload', to: 'resumes#upload'
  post '/info', to: 'resumes#info'

  authenticated :user do
    root 'resumes#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
