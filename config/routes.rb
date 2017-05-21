Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'Admin', at: 'auth'  
  end

 devise_for :mentors, controllers: {
    # sessions: 'students/sessions',
    invitations: 'mentors/invitations'
  }

 resources :programs
end
