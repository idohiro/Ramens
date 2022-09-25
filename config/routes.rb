Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

    # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  root :to =>"homes#top"
  get 'homes/about'

  namespace :admin do
    resources :customers, only: [:index, :show]
  end
  namespace :public do
    get 'customers/confirm'
     resources :customers, only: [:index, :edit, :update, :create, :show] do
        collection do
      patch :withdraw
      end
        member do
            get :favorites
        end
       resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

    end

     resources :ramens, only: [ :index, :edit, :update, :create, :show, :destroy, :new] do
         resource :favorites, only: [:create, :destroy]
        resources :ramen_comments, only: [:create, :destroy]
     end
      get "search" => "searchs#search"


     post 'ramen/:id' => 'ramens#show'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
