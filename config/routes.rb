Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # resources :items, only: [:show, :index]
      get '/items', to: 'items#index'
      get '/items/random', to: 'items#random'
      get '/items/find', to: 'items#show'
      get '/items/find_all', to: 'items#index'
      get '/items/:id', to: 'items#show'
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :invoices, only: [:show, :index]
      get '/invoices', to: 'invoices#index'
      get '/invoices/random', to: 'invoices#random'
      get '/invoices/find', to: 'invoices#show'
      get '/invoices/find_all', to: 'invoices#index'
      get '/invoices/:id', to: 'invoices#show'
    end
  end

  namespace :api do
    namespace :v1 do
      get '/transactions', to: 'transactions#index'
      get '/transactions/random', to: 'transactions#random'
      get '/transactions/find', to: 'transactions#show'
      get '/transactions/find_all', to: 'transactions#index'
      get '/transactions/:id', to: 'transactions#show'
      # resources :transactions, only: [:show, :index]
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :merchants, only: [:show, :index]
      get '/merchants', to: 'merchants#index'
      get '/merchants/random', to: 'merchants#random'
      get '/merchants/find', to: 'merchants#show'
      get '/merchants/find_all', to: 'merchants#index'
      get '/merchants/:id', to: 'merchants#show'
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :customers, only: [:show, :index]
      get '/customers', to: 'customers#index'
      get '/customers/random', to: 'customers#random'
      get '/customers/find', to: 'customers#show'
      get '/customers/find_all', to: 'customers#index'
      get '/customers/:id', to: 'customers#show'
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :customers, only: [:show, :index]
      get '/invoice_items', to: 'invoice_items#index'
      get '/invoice_items/random', to: 'invoice_items#random'
      get '/invoice_items/find', to: 'invoice_items#show'
      get '/invoice_items/find_all', to: 'invoice_items#index'
      get '/invoice_items/:id', to: 'invoice_items#show'
    end
  end

  namespace :api do
    namespace :v1 do
      #relationship endpoints
      get '/merchants/:id/items', to: 'merchant_relations#index'
      get '/merchants/:id/invoices', to: 'merchant_relations#index'
      get '/invoices/:id/transactions', to: 'invoice_relations#index'
      get '/invoices/:id/invoice_items', to: 'invoice_relations#index'
      get '/invoices/:id/items', to: 'invoice_relations#index'
      get '/invoices/:id/customer', to: 'invoice_relations#show'
      get '/invoices/:id/merchant', to: 'invoice_relations#show'
      get '/customers/:id/invoices', to: 'customer_relations#index'
      get '/customers/:id/transactions', to: 'customer_relations#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
