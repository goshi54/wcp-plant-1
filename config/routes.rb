Rails.application.routes.draw do
  scope module: :public do
  root to: "homes#top"
  get 'customers/my_page' => 'customers#show'
  get 'customers/edit'
  patch 'customers/update'

    get 'customers/unsubscribe'
    patch 'customers/withdraw'

      resources :items, only: [:index, :show]
      resources :orders, only: [:index, :show, :new, :create] do
        collection do
          post 'confirm' => 'orders#confirm'
          get 'complete'
        end
      end
      resources :carts, only: [:index, :create, :update, :destory] do
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

  namespace :admin do
    root to: "homes#top"
   resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :orders, only: [:show, :update]
    resources :customers,only:[:index,:show,:edit,:update]


  end

end