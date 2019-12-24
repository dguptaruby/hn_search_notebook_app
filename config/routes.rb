require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  resources :notebooks  do
    member do
      delete 'destroy_result'
    end
    collection do
      post 'statistics'
    end
  end
 
  resources :search_results do 
    member do 
      get 'add'
    end
  end

  resources :hn_search_notebooks do 
    collection do 
      get 'search'
    end
  end

  root to: 'notebooks#statistics'
end
