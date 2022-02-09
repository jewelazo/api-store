Rails.application.routes.draw do
  namespace :api do
    get "/products" , to:"products#index"
    get '/products/search', to: "products#search"
  end
end
