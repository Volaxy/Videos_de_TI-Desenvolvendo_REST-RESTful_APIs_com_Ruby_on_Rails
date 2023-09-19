Rails.application.routes.draw do
  resources :kinds
    resources :contacts # É o mesmo que "get "'/contacts', to: 'contacts#index' "
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
end
