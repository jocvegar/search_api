Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "application#index"
  defaults format: :json do
    namespace :api do
      namespace :v1 do
        # resources :tests
        scope '/:media_type' do
          get 'media_search/:query' => "media_search#query", as: "media_search_query"
          get 'media_search' => "media_search#missing_query", as: "media_search_missing_query"
        end
      end
    end
  end
end
