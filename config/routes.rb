Rails.application.routes.draw do
  resources :companies, only: [:index, :new, :create, :show]   
  root "companies#index"  
end
