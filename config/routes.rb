Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}



  #customer側↓

  scope module: :customer do
    #ホーム画面ルーティング
    root to: 'homes#top'
    get 'home/about' => 'homes#about'

    #カスタマー
    resource :customers, only: [:edit, :update]
      get 'customers/my_page' => 'customers#show'
      get 'customers/leave' => 'customers#leave'
      patch 'customers/withdraw' => 'customers#withdraw'

    #商品
    resources :items, only: [:index, :show]

    #注文
    resources :orders, only: [:index, :show, :create, :new] do
      get 'complete',   on: :collection
      post 'confirm', on: :collection
    end

    #カート商品
    resources :carts, only:[:index, :destroy, :edit, :update, :create] do
      collection do
        delete 'carts/destroy_all' => 'carts#destroy_all'
      end
    end
  end

  #admin側↓

  namespace :admin do
    #トップページのルーティング

    get '/' => 'homes#top'

    #カスタマー
    resources :customers, only:[:index, :show, :edit, :update]

    #商品
    resources :items, except:[:destroy]

    #注文
    resources :orders, only:[:show, :update]

  end
end