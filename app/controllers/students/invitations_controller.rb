  class Students::InvitationsController < Devise::InvitationsController
    include InvitableMethods
    # before_action :authenticate_user!, only: :create
    # before_action :resource_from_invitation_token, only: [:edit, :update]

    def create
      Student.invite!(invite_params, current_student)
      render json: { success: ['Student created.'] }, status: :created
    end

    def edit
      redirect_to "#{client_api_url}?invitation_token=#{params[:invitation_token]}"
    end

    def update
      student = Student.accept_invitation!(accept_invitation_params)
      if @student.errors.empty?
        render json: { success: ['Student updated.'] }, status: :accepted
      else
        render json: { errors: student.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def resource_from_invitation_token
      @student = Student.find_by_invitation_token(params[:invitation_token], true)
      return if params[:invitation_token] && @student
      render json: { errors: ['Invalid token.'] }, status: :not_acceptable
    end

    def authenticate_inviter!
      # use authenticate_user! in before_action
    end

    def authenticate_student!
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
      params.require(:student).permit(:email, :invitation_token, :provider, :skip_invitation)
    end

    def accept_invitation_params
      params.permit(:password, :password_confirmation, :invitation_token)
    end
  end
