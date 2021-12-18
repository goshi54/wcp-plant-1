Rails.application.routes.draw do
  get 'order_details/admin'
  scope module: :public do
  root to: "homes#top"
  get 'customers/my_page' => 'customers#show'
  get 'customers/edit'
  patch 'customers/update'

   get 'customers/my_page' => 'customers#show'
   get 'customers/leave' => 'customers#leave'
   patch 'customers/withdraw' => 'customers#withdraw'

    get 'customers/unsubscribe'
    patch 'customers/withdraw'

      resources :comments, only: [:index, :new, :create, :destroy]
      resources :items, only: [:index, :show]
      resources :orders, only: [:index, :show, :new, :create] do
        collection do
          post 'confirm' => 'orders#confirm'
          get 'complete'
        end
      end
      resources :carts, only: [:index, :create, :update, :destroy] do
        collection do
        delete 'destroy_all'
      end
      end
      resources :address, except: [:new, :show]
    end

    #管理者用のルーティング
    devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions:'admin/sessions'
  }
#エンドユーザー側のルーティング設定
devise_for :customers, path: "", skip: [:passwords,], controllers: {
  sessions:      'public/sessions',
  registrations: 'public/registrations'
}

   get "/about" => "public/homes#about"
   get 'customers/my_page' => 'customers#show'
   get 'customers/leave' => 'customers#leave'
   patch 'customers/withdraw' => 'customers#withdraw'

  namespace :admin do
    root to: "homes#top"
   resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :orders, only: [:show, :update]
    resources :customers,only:[:index,:show,:edit,:update]


  end

end