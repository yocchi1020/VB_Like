Rails.application.routes.draw do

  devise_for :members, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'

  devise_scope :member do
    post 'public/members/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end



  namespace :public do
    get "home/about"=>"homes#about", as: "about"
    get 'members/unsubscribe'
    patch 'members/withdraw' => 'members#withdraw'
    resources :members, only: [:edit, :index, :show, :update] do
      member do
        get :favorites
      end
    end
    resources :teams, only: [:new, :create, :edit, :destroy, :index, :show, :update] do
      resources :team_comments, only: [:create, :destroy]
      get "join" => "teams#join"
    end
    resources :tournaments, only: [:new, :create, :edit, :destroy, :index, :show, :update] do
      resource :favorites, only: [:create, :destroy]
    end
  end

  namespace :admin do
    get 'homes/top'
    resources :teams, only: [:edit, :index, :show, :update]
    resources :members, only: [:edit, :index, :show, :update]
    resources :tournaments, only: [:edit, :index, :show, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
