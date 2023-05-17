Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



  #resources :companies
  #resources :companies do
  # resources :departments
  # end
  # resources :people, only: [:index, :show, :new, :edit, :update, :destroy]
  # resources :companies do
  # resources :departments do
  #   resources :teams do
  #     resources :people_in_teams
  #     resources :team_projects
  #   end
  # end
  #  resources :people
  #  resources :projects
  # end
  get 'home/index'
  root 'home#index'
  resources :people

  resources :companies

  resources :companies do
  resources :departments
  end

  resources :departments


  resources :people_in_teams
  get '/people_in_teams' , to: 'people_in_teams#index'


  resources :projects
  # get '/projects' , to: 'projects#index'
  resources :team_projects
  #get '/team_projects' , to: 'team_projects#index'
  resources :teams
  #get '/teams' , to: 'teams#index'

  resources :companies do
    resources :departments do
      resources :teams
    end
    end

end
