Rails.application.routes.draw do
  resources :vocabulariopalavras
  resources :vocabularios
  resources :atendimentopalavras
  resources :atendimentos
  resources :empresas
  resources :profissionals
  resources :clientes
  resources :pacientes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  #ROTA PARA O CONTROLADOR HELLO
  get 'hello_world', to: 'hello#world'


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
  end

  resources :vocabulariopalavras # Mantenha esta rota se você a tiver

  # ... suas outras rotas ...

end
