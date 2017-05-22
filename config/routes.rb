Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'auth'  

 devise_for :mentors, controllers: {
    # sessions: 'students/sessions',
    invitations: 'mentors/invitations'
  }

  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions'
  # }
 resources :programs
end
