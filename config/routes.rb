Rails.application.routes.draw do
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"

    mount_devise_token_auth_for 'User', at: 'auth'
    
    resources :kinds

    # Deste modo, a versão irá ser colocada antes do caminho do recurso: ".../v1/contacts"
    # Para cada pasta antecessora, colocar "FOLDER_NAME::MODULE_NAME"
    api_version(:module => "Versions::V1", :path => {:value => "v1"}) do
            resources :contacts do
                resource :kind, only: [:show] # Define uma rota de "Kind" juntamente com "contacts" na URL, para retornar o "Kind" a partir do Id do "Contact"
                resource :phones, only: [:show]
                resource :address, only: [ :show, :create, :update, :destroy ]
            end
        end

    api_version(:module => "Versions::V2", :path => {:value => "v2"}) do
        resources :contacts do
            resource :kind, only: [:show]
            resource :phones, only: [:show]
            resource :address, only: [ :show, :create, :update, :destroy ]
        end
    end
end
