Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :club_sports
    resources :sports
    resources :clubs
    resources :events

    root to: "users#index"
  end

  root to: "pages#home"

  resources :events, only: [:index, :show]
  resources :clubs, only: [:index, :show]

  devise_for :users,
  controllers: {
    registrations: "users/registrations"
  }
  
  authenticated :user, lambda {|u| u.is_club_admin?} do
    resources :clubs, only: %i[new create edit update destroy] do
      resources :events, only: %i[new create edit update destroy]
    end
  end

  authenticated :user, lambda { |u| u.is_event_admin? } do
    resources :events, only: %i[new create edit update destroy]
  end

  scope controller: :pages do
    get :about
    get :pros
    get :terms
    get :privacy
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
