Rails.application.routes.draw do
  
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  
end
