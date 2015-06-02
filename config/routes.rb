Rails.application.routes.draw do
  root "stuffs#index"
  namespace :api, :defaults => {:format => :json} do 
    namespace :v1 do
      resources :stuffs, only: [:create]
    end
  end
end
