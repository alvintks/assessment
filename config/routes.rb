Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, controller: "users" do 
    resources :postings, controller: "postings" do
      resources :comments, controller: "comments", only: [:new, :create]
    end 
  end 

  resources :admins, controller: "admins", only: [:destroy, :index]

    resources :postings, controller: "postings" do
    member do
      put "like", to: "postings#upvote"
    end 
  end 

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
