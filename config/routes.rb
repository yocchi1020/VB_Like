Rails.application.routes.draw do

  devise_for :members, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'

  namespace :public do
    get "home/about"=>"homes#about", as: "about"
    get 'members/unsubscribe'
    patch 'members/withdraw' => 'members#withdraw'
    resources :members, only: [:edit, :index, :show, :update]
    resources :tournaments, only: [:new, :create, :edit, :destroy, :index, :show, :update]
    resources :teams, only: [:new, :create, :edit, :destroy, :index, :show, :update]
  end

  namespace :admin do
    get 'homes/top'
    resources :tournaments, only: [:edit, :index, :show, :update]
    resources :members, only: [:edit, :index, :show, :update]
    resources :teams, only: [:edit, :index, :show, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
