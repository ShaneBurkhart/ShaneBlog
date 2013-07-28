ShaneBlog::Application.routes.draw do
  root :to => "articles#index"
  devise_for :users

  resources :articles, only: ["index", "show"]

end
