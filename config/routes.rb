Rails.application.routes.draw do
  root "stuffs#index"
  namespace :api, :defaults => {:format => :json} do 
    namespace :v1 do
      namespace :slack do
        resources :stuffs
      end
    end
  end
end
