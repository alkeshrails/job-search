Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'job_search' => 'welcome#job_search', :as => 'job_search'
  get 'job_listing' => 'welcome#job_listing'
  root 'welcome#index'
end
