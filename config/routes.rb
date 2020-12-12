Rails.application.routes.draw do
  get 'money_m/index' => 'money_m#index'
  resources :events
  devise_for :users
  
  root 'home#top'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
