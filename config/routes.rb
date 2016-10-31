Rails.application.routes.draw do
  devise_for :adminusers
  devise_for :users

  resources :towns
  resources :divisions
  resources :users 
  resources :adminusers

  #for api
  get "api/all_user_list" => "api#all_user_list"
  get "api/user_list_by_division" => "api#user_list_by_division"
  get "api/user_list_by_town" => "api#user_list_by_town"
  get "api/all_town_list" => "api#all_town_list"
  get "api/town_list_by_town" => "api#town_list_by_town"
  get "api/all_division_list" => "api#all_division_list"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'divisions#index'
end

