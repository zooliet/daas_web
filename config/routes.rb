require 'sidekiq/web'

DaasWeb::Application.routes.draw do

  resources :services do
    collection { get :events }
  end
  
  resources :transcodings
	
  post    '/user_assets',         to: 'assets#create',    as: 'create_assets'
  delete  '/user_assets',         to: 'assets#destroy',   as: 'destroy_assets'
  get     '/user_assets/(*path)', to: 'assets#index',     as: 'assets'
  get     '/user_asset/(*path)',  to: 'assets#show',      as: 'asset'
  
  root to: 'services#index'
  mount Sidekiq::Web, at: "/sidekiq"

  # get '/user_asset/(*path)',  to: 'assets#show',    as: 'asset'
  # 

  #   resources :tasks do
  #     collection { get :events }
  # end
  # root to: 'tasks#index'
  
end


