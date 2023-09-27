Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :jobs

      resources :users, only: [:create]
      post 'login', to: 'users#login'

      resources :jobs_applications
      get 'my_applications', to: 'jobs_applications#my_applications'
    end
  end
end