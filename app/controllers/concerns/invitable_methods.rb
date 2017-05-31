module InvitableMethods
  extend ActiveSupport::Concern

  def authenticate_inviter!
    # use authenticate_user! in before_action
  end

  def authenticate_user!
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

end