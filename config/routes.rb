ShaneBlog::Application.routes.draw do
  devise_for :admin, only: ["sessions"]

  root :to => "articles#index"
  resources :articles, except: ["index"]
  match "articles_archive", to: "articles#list"

end
