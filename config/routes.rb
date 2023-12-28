Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "brickfolio", to: "users#show", as: "brickfolio"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  resources :bricks do
    resources :chatrooms, only: %i[show create] do
      resources :messages, only: %i[create]
    end
    resources :buy_requests, only: %i[create update] do
      member do
        patch :accept
        patch :reject
      end
    end
  end

  resources :buy_requests, only: %i[destroy]

end
