Rails.application.routes.draw do

  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks",
    }

  get root to: "pages#home"

  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
end
