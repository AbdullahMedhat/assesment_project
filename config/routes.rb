Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'auth'
  resources :programs

# devise_for :mentors, controllers: { invitations: 'mentors/invitations' }
# mount_devise_token_auth_for 'Mentor', at: 'auth'

# devise_for :students, controllers: { invitations: 'students/invitations' }
# mount_devise_token_auth_for 'Student', at: 'auth'

  # mount_devise_token_auth_for 'Student', at: 'student_auth'
  # as :student do
  #   # Define routes for Student within this block.
  # end

    mount_devise_token_auth_for 'Student', at: 'student_auth', skip: [:invitations]
    devise_for :students, only: [:invitations], controllers: { invitations: 'students/invitations' }

    mount_devise_token_auth_for 'Mentor', at: 'mentor_auth', skip: [:invitations]
    devise_for :mentors, only: [:invitations], controllers: { invitations: 'mentors/invitations' }

  root to: redirect( "https://assesmentmakinah.herokuapp.com/")
end
