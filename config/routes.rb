Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
    resources :kinds
    resources :contacts do # É o mesmo que "get "'/contacts', to: 'contacts#index' "
        resource :kind, only: [:show] # Define uma rota de "Kind" juntamente com "contacts" na URL, para retornar o "Kind" a partir do Id do "Contact"
        resource :phones, only: [:show]
        resource :address, only: [ :show, :create, :update, :destroy ]
    end

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
end
