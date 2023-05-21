Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :companies do
    resources :departments
  end

  resources :people
  post '/people', to: 'people#create'


  resources :companies do
    resources :departments do
      resources :teams
    end
    # відділ буде видалений з бази даних і перенаправлені на сторінку зі списком відділів компанії.
    delete '/companies/:company_id/departments/:id', to: 'departments#destroy', as: 'company_department'

  end
  resources :companies
  resources :departments
  resources :teams
  resources :people_in_teams
  resources :projects
  resources :team_projects
end
