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
    resources :items
  end

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
