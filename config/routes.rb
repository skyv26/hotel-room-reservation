Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :hotels do
        resources :rooms, only: [:create]
      end
      resources :services
      resources :rtypes
      resources :rooms, only: [:index, :destroy, :update, :show]
    end
  end
end
