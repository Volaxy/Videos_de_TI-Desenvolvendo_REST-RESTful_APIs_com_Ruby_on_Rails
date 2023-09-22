Rails.application.routes.draw do
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"

    mount_devise_token_auth_for 'User', at: 'auth'
    
    resources :kinds

    scope module: "versions" do
        api_version(:module => "v1", :parameter => {:name => "version", :value => "1"}) do
        # É possível passar o número da versão através do cabeçalho da requisição, informando no valor a versão, como escrito abaixo
        # Para fazer a mesma coisa com um header personalizado, coloca-se: "X-version", onde o "X- significa que é um cabeçalho personalizado"
        # api_version(:module => "v1", :header => {:name => "Accept", :value => "application/vnd.api+json; version=1"}) do
            resources :contacts do
                resource :kind, only: [:show] # Define uma rota de "Kind" juntamente com "contacts" na URL, para retornar o "Kind" a partir do Id do "Contact"
                resource :phones, only: [:show]
                resource :address, only: [ :show, :create, :update, :destroy ]
            end
        end

        api_version(:module => "v2", :parameter => {:name => "version", :value => "2"}) do
            resources :contacts do
                resource :kind, only: [:show]
                resource :phones, only: [:show]
                resource :address, only: [ :show, :create, :update, :destroy ]
            end
        end
    end
end
