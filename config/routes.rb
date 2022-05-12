Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: 'admin/sessions',
  }

  # devise_for :customers, controllers: {
  #   sessions:      'customers/sessions',
  #   passwords:     'customers/passwords',
  #   registrations: 'customers/registrations'
  # }

  namespace :admin do
    root 'homes#top'
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :edit, :update, :show]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end

  scope module: 'public' do
    resources :homes, only:[:top]
    get "/customers/my_page" => "customers#show", as: "customer"
    get 'customers/edit' => "customers#edit", as: "edit_customer"
    get 'customers/confirm_withdraw' => "customers#confirm", as: "confirm_withdraw_customer"
    resources :customers, only:[:update]
    root 'homes#top'
    get "/about" => "homes#about", as: "about"
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
