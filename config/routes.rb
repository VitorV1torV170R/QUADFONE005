Rails.application.routes.draw do
  get "graficos/index"
  get "home/index"
  resource :session
  resources :passwords, param: :token
  resources :atendimentopalavras
  resources :vocabulariopalavras
  resources :vocabularios
  resources :atendimentos
  #resources :empresas
  resources :profissionals
  resources :clientes
  resources :pacientes
  resources :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  resources :atendimentos do
    # Adiciona uma rota POST específica para um membro (um atendimento específico)
    member do
      post 'importar_palavras_vocabulario'
    end

    member do
      post :adicionar_palavras
    end

  end

  #Rota para exibir infos ligados a empresa
  resources :empresas do
    member do
      get :profissionals
      get :atendimentos
      get :pacientes
      get :clientes
    end
  end

  #Rota para exibir infos ligados ao profissional 
  resources :profissionals do
    member do
      get :atendimentos
      get :pacientes
      get :clientes
    end
  end

  resources :vocabulariopalavras # Mantenha esta rota se você a tiver

  # ... suas outras rotas ...

  #Rota definida para a pagina inicial do aplicativo
  root "home#index"

  get "graficos", to: "graficos#index"

end
