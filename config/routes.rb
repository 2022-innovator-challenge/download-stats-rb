Rails.application.routes.draw do
  delete 'download-stats/bulk', to: 'download_stats#bulk_destroy'
  post 'download-stats/bulk', to: 'download_stats#bulk_create'

  resources :download_stats, :path => 'download-stats' do
  end
end
