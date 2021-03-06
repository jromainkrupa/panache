Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :sports
      resources :clubs
      resources :events
      resources :sponsors
      resources :stats, only: [:index]


      root to: "stats#index"
    end
  root to: "pages#home"

  devise_for :users,
  controllers: {
    registrations: "users/registrations"
  }
  
  resources :clubs
  resources :events

  scope controller: :pages do
    get :about
    get :pros
    get :terms
    get :privacy
  end
end
