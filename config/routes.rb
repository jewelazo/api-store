Rails.application.routes.draw do
  namespace :api do
    get "/products" , to:"products#index"
    get '/search', to: "products#search"
  end
end
