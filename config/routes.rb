Rails.application.routes.draw do
  get 'order_details/update'
  devise_for :admins, controllers: {sessions: "admins/sessions"}

  namespace :admins do
    get 'homes/top'
    get '/search' => 'search#search'
    resources :customers,  only:[:index, :show, :edit, :update]
    resources :orders,  only:[:index, :show, :update]
    resources :order_details,  only:[:update]
    resources :genres,  only:[:index, :create, :edit, :update]
    resources :items,  only:[:index, :show, :new, :create, :edit, :update]
  end

  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
   }


  root'items#top'
  get 'items/top' => 'items#top', as: 'customer_top'
  get 'items/about' => 'items#about', as: 'customer_about'
  resources :items, only: [:index, :show]

  resources :customers, only: [:edit, :show, :update]
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
    put "/customers/:id/withdraw" => "customers#withdraw", as: 'customers_withdraw'

  resources :orders, only: [:new, :index, :create, :show]
     post 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
     get 'orders/thanks' => 'orders#thanks', as: 'order_thanks'

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
        delete 'destroy_all'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
