Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  

  resources :articles
    resources :comments #creates comments as a nested resource within articles
  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"
end
