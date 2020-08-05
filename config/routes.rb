Rails.application.routes.draw do
  resources :doctors 
  get '/doctors/:id/:date', to: 'appointments#index'
  resources :patients 
  resources :appointments 
end
