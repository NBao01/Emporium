Rails.application.routes.draw do
  resources :categories
  get 'favorites', to: 'static_pages#favorites'
  get 'order/index'
  get 'order/show'
  post 'order/show'
  post 'order/close'
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
  post 'cart/remove'
  post 'cart/clear'
  resources :books do
    resources :comments
    member do
      post 'like'
      post 'unlike'
    end
  end
  resources :publishers
  resources :authors
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
