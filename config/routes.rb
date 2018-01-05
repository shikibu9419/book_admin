Rails.application.routes.draw do
  get 'profile/show'

  get 'profile/edit'

  get 'profile/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/books/:id" => "books#show"

  # 複数のルーティングを設定 (.../publishers/id)
  resources :publishers do
    # ルーティング拡張 (.../publishers/:publisher_id/books/:id)
    resources :books

    # リソースに対し個別にアクション (.../publishers/:id/details)
    member do
      get 'detail'
    end

    # リソース全体に対しアクション (.../publishers/search)
    collection do
      get 'search'
    end
  end

  resource :profile, only: %i{show edit update}
end
