Rails.application.routes.draw do
  get 'checkout/index'
  post 'checkout/place_order'
  get 'checkout/thank_you'
  resources :users do
    collection do
      get 'login'
      post 'do_login'
      get 'logout'
    end
  end
  root 'static_pages#home'
  get 'catalog/index'
  get 'catalog/show'
  get 'catalog/search'
  get 'catalog/latest'
  get 'cart/add'
  post 'cart/add'
  get 'cart/remove'
  post 'cart/remove'
  get 'cart/clear'
  post 'cart/clear'
  resources :books do
    resources :comments
  end
  resources :publishers
  resources :authors
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
