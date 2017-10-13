Rails.application.routes.draw do


  resources :blogs, only: [:index, :show]

  mount Ckeditor::Engine => '/ckeditor'
  namespace :managment do
    resources :kbs
    resources :blogs
    resources :accounts do
      resources :transactions do
        member do
          patch :comfirm
        end
      end
    end
    resources :transactions do
      member do
        patch :comfirm
      end
    end
  end
  resources :welcome, only: [:new, :create]
  resources :managment
  #knowlege base and forum starts here
  resources :kbs, only: [:index, :show]

  #accounts  and accounts api and transactions starts here
  resources :accounts do
    resources :transactions
  end
  namespace :api do
    namespace :v1 do
      post "accounts/new_transaction", to: "accounts#new_transaction"
    end
  end

  #tests to be reworked
  resources :deposits
  resources :balances, except: [:show]
  get 'balances/history',  to: 'balances#history'

  namespace :balance do
    resources :withdraw, only: [:new, :create]
    resources :depositor, only: [:new, :create]
  end

  #dynamic rerouting
  authenticated :user do
    root 'accounts#index', as: "authenticated_root"
  end

  authenticated :managment do
    root "managment#index"
  end

  #admins starts here
  devise_for :managments
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :pages, only: [:show]
  ActiveAdmin.routes(self)

  #hompage
  root 'welcome#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
