Rails.application.routes.draw do
  resources :events
  root to: "pages#home"

  resources :events, only: [:index, :show]
  resources :clubs, only: [:index, :show]

  devise_for :users
  
  authenticated :user, lambda {|u| u.is_club_admin?} do
    resources :clubs, only: %i[new create edit update destroy] do
      resources :events, only: %i[new create edit update destroy]
    end
  end

  scope controller: :pages do
    get :about
    get :terms
    get :privacy
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
