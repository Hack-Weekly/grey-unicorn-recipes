Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root to: "recipes#index"

  resources :recipes, except: [:index] do
    collection do
      get "search"
      get "ingredient_field"
    end
  end
end
