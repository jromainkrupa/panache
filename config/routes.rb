Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users,
  controllers: {
    registrations: "users/registrations"
  }

  namespace :admin do
    resources :users
    resources :club_sports
    resources :sports
    resources :clubs
    resources :events

    root to: "users#index"
  end
  
  # the policy is set with pundit.
  resources :clubs
  resources :events

  scope controller: :pages do
    get :about
    get :pros
    get :terms
    get :privacy
  end
end
