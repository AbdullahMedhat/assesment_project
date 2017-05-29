Rails.application.routes.draw do
  resources :programs
  resources :submissions
  mount_devise_token_auth_for 'Admin', at: 'auth'

  mount_devise_token_auth_for 'Student', at: 'student_auth', skip: [:invitations]
  devise_for :students, only: [:invitations], controllers: { invitations: 'students/invitations' }

  mount_devise_token_auth_for 'Mentor', at: 'mentor_auth', skip: [:invitations]
  devise_for :mentors, only: [:invitations], controllers: { invitations: 'mentors/invitations' }

  root to: redirect('/')
end
