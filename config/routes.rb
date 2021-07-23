Rails.application.routes.draw do
  root to: "pages#home"

  resources :events, only: [:index, :show]

  devise_for :users
  
  authenticated :user, lambda {|u| u.is_club_admin?} do
    resources :clubs, only: %i[new create edit update destroy] do
      resources :events, only: %i[new create edit update destroy]
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
