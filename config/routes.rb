Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # resources :items, only: [:show, :index]
      get '/items.json', to: 'items#index'
      get '/items/:id.json', to: 'items#show'
      get '/items/find', to: 'items#show'
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :invoices, only: [:show, :index]
      get '/invoices.json', to: 'invoices#index'
      get '/invoices/:id.json', to: 'invoices#show'
      get '/invoices/find', to: 'invoices#show'

    end
  end

  namespace :api do
    namespace :v1 do
      get '/transactions.json', to: 'transactions#index'
      get '/transactions/:id.json', to: 'transactions#show'
      get '/transactions/find', to: 'transactions#show'
      # resources :transactions, only: [:show, :index]
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :merchants, only: [:show, :index]
      get '/merchants.json', to: 'merchants#index'
      get '/merchants/:id.json', to: 'merchants#show'
      get '/merchants/find', to: 'merchants#show'

    end
  end

  namespace :api do
    namespace :v1 do
      # resources :customers, only: [:show, :index]
      get '/customers.json', to: 'customers#index'
      get '/customers/:id.json', to: 'customers#show'
      get '/customers/find', to: 'customers#show'
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :customers, only: [:show, :index]
      get '/invoiceitems.json', to: 'invoice_items#index'
      get '/invoiceitems/:id.json', to: 'invoice_items#show'
      get '/invoiceitems/find', to: 'invoiceitems#show'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
