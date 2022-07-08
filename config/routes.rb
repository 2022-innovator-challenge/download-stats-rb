Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :download_stats, :path => 'download-stats'

  post 'download-stats/bulk', to: 'download_stats#bulk_create'
end
