class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # before_action :authenticate_custom
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_inviter!
    authenticate_admin!(:force => true)
  end

  # protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:program_id])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:session])
  end
  # def authenticate_custom
  #   authenticate_mentor! unless admin_signed_in?
  # end
end
