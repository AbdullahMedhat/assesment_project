class InvitationsController < Devise::InvitationsController
  include InvitableMethods
  before_action :authenticate_admin!, only: :create
  before_action :resource_from_invitation_token, only: [:edit, :update]

  def create
    Mentor.invite!(invite_params, current_mentor)
    render json: { success: ['mentor created.'] }, status: :created
  end

  def edit
    redirect_to "#{client_url}?invitation_token=#{params[:invitation_token]}"
  end

  def update
    mentor = Mentor.accept_invitation!(accept_invitation_params)
    if @mentor.errors.empty?
      render json: { success: ['mentor updated.'] }, status: :accepted
    else
      render json: { errors: mentor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def invite_params
    params.permit(mentor: [:email, :invitation_token, :provider, :skip_invitation])
  end

  def accept_invitation_params
    params.permit(:password, :password_confirmation, :invitation_token)
  end
end