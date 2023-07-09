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
      get "ingredient_field"
    end
  end

  get "search", to: "recipes#search", as: "search"
end
