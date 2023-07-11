Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  root to: "recipes#index"

  get "/user/recipes", to: "recipes#user_recipes", as: "user_recipes"

  resources :recipes, except: [:index] do
    collection do
      get "search"
      get "ingredient_field"
    end
  end
end
