Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'Admin', at: 'auth'  
  end

 resources :programs
end
