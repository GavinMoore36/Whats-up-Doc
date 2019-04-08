Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :hospitals, only: [:index]
      resources :doctors, only: [:index, :update, :create]
      resources :patients, only: [:index, :update, :create]
      resources :visits, only: [:index, :update, :create]
      resources :chats, only: [:index, :update, :create]
      post 'login', :to => 'login#login'
      post 'patients/login', :to => 'login#patient_login'
    end
  end
end
