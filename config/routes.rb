Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :companies
  resources :companies do
    resources :departments
  end
  resources :peoples, only: [:index, :show, :new, :edit, :update, :destroy]
  resources :companies do
    resources :departments do
      resources :teams
    end
  end
  resources :peoples_in_teams
  resources :projects
  resources :team_projects
end
