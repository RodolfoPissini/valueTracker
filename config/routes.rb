Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :balances, only: [:create, :show] # Adicionando :show para permitir o GET de um saldo específico
      post 'subtract_balance/:id', to: 'balances#subtract'
    end
  end
end
