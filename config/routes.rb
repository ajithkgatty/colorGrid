Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'store_data', :to => 'users#store_data'
  resources :users, only: [:index] 

  root "users#index"
 
end
