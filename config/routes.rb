Rails.application.routes.draw do
  devise_for :users
  resources :locations do
  	resources :recordings
  end
  
  root 'locations#index'

end
