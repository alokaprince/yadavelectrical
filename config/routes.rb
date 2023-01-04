Rails.application.routes.draw do
  resources :dealeritems
  resources :dealerbills
  resources :dealers
  devise_for :users
  resources :works
  resources :dailyexps
  resources :stocks
  resources :items
  resources :bills
  resources :customers do
    resources :bills
  end
  resources :bills do
    resources :items
  end
  resources :dealers do
    resources :dealerbills
  end
  resources :dealerbills do
    resources :dealeritems
  end
  post 'bills/index', to: 'bills#index'
  post 'dailyexps/index', to: 'dailyexps#index'
  get '/search' => 'customers#search', :as => 'search_page'
  get '/dealersearch' => 'dealers#dealersearch', :as => 'dealersearch_page'
  post '/search1' => 'works#search1', :as => 'search1_page'
  post '/search2' => 'stocks#search2', :as => 'search2_page'
  get '/print' => 'customers#print', :as => 'print_page'
  get '/print2' => 'bills#print2', :as => 'print2_page'
  get '/print3' => 'dealers#print3', :as => 'print3_page'
  get '/print4' => 'dealers#print4', :as => 'print4_page'
  post 'pay1/:id', to: 'bills#pay1', :as => 'pay1_page'
  post 'pay2/:id', to: 'dealerbills#pay2', :as => 'pay2_page'
  post 'credit/:id', to: 'bills#credit', :as => 'credit_page'
  post 'credit2/:id', to: 'dealerbills#credit2', :as => 'credit2_page'
  root "customers#index"
end
