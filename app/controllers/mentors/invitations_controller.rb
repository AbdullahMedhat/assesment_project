      class Mentors::InvitationsController < Devise::InvitationsController
    include InvitableMethods
    # before_action :authenticate_admin!, only: :create
    # before_action :resource_from_invitation_token, only: [:edit, :update]

    def create
      Mentor.invite!(invite_params, current_mentor)
      render json: { success: ['Mentor created.'] }, status: :created
    end

    def edit
      redirect_to "#{client_api_url}?invitation_token=#{params[:invitation_token]}"
    end

    def update
      mentor = Mentor.accept_invitation!(accept_invitation_params)
      if @mentor.errors.empty?
        render json: { success: ['Mentor updated.'] }, status: :accepted
      else
        render json: { errors: mentor.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def resource_from_invitation_token
      @mentor = Mentor.find_by_invitation_token(params[:invitation_token], true)
      return if params[:invitation_token] && @mentor
      render json: { errors: ['Invalid token.'] }, status: :not_acceptable
    end

    def authenticate_inviter!
      # use authenticate_admin! in before_action
    end

    def authenticate_mentor!
      return if current_user
      render json: {
        errors: ['Authorized users only.']
      }, status: :unauthorized
    end

    def resource_class(m = nil)
      if m
        mapping = Devise.mappings[m]
      else
        mapping = Devise.mappings[resource_name] || Devise.mappings.values.first
      end
      mapping.to
    end

    private

    def invite_params
      params.require(:mentor).permit(:name, :email, :invitation_token, :provider, :skip_invitation, :program_id)
    end

    def accept_invitation_params
      params.permit(:password, :password_confirmation, :invitation_token)
    end
  end
