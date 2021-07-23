Rails.application.routes.draw do
  root to: "pages#index"

  devise_for :users
  
  resources :clubs, only: [:index, :show]
  
  authenticated :user, lambda {|u| u.is_club_admin?} do
    resources :clubs, only: %i[new create edit update destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
