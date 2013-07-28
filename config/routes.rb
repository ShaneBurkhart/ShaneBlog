ShaneBlog::Application.routes.draw do
  root :to => "articles#index"
  devise_for :users

  resources :articles, only: ["show"]
  match "articles_archive", to: "articles#list"

end
