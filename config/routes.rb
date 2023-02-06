Rails.application.routes.draw do
  root "user_books#index"

  resources :user_books
  resources :users do
    member do 
      get :delete
    end
  end

  resources :books do
    member do
      get :delete
    end
  end
end
