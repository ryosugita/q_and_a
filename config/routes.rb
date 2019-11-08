Rails.application.routes.draw do
    root to: "toppages#index"
    
    get "signup", to: "users#new"
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    
    resources :users, only: [:show, :new, :create, :edit, :update] do
        member do
            get :qlists
            get :alists
        end
    end    
    resources :questions, only: [:show, :new, :create, :destroy]
    resources :answers, only: [:create]
end
