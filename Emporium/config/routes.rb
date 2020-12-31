Rails.application.routes.draw do
  resources :books
  resources :publishers
  resources :authors
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
