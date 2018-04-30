Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'

  get "/team" => "pages#team"
  get "/contact" => "pages#join_us"

  #creer les routes CRUD en mettant le nom du controller
  resources :products

##READ ACTIONS ROUTES
#  get "/products" => "products#index"
#  #url dynamique
#  get "/products/:id" => "products#show"
#
##CREATE ACTIONS ROUTES
#	get "/products/new" => "products#new"
#	post "/products" => "products#create"
#
##UPDATE ACTIONS ROUTES
#	get "/products/:id/edit" => "products#edit"
#	patch "/products/:id" => "products#update"
#
##DELETE ACTIONS ROUTES
#	delete "/products/:id" => "products#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
