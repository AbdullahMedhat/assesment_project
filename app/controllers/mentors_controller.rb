# Class Mentor
class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
    render json: @mentors
  end

  def show
    @mentor = Mentor.find(params[:id])
    render json: @mentor
  end

  def edit
    @mentor = Mentor.find(params[:id])
  end

  def update
    @mentor = Mentor.accept_invitation!(accept_invitation_params)
    if @mentor
      redirect_to 'http://localhost:3001/'
    else
      render json: { errors: 'Invitation is invalid!' },
             status: :unprocessable_entity
    end
  end

  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.destroy
  end

  private

  def mentor_params
    params.require(:mentor).permit(:name, :bio, :submissions, :program_id,
    :email, :password, :password_confirmation, :invitation_token)
  end

  def accept_invitation_params
    params.require(:mentor).permit(:password, :password_confirmation,
    :invitation_token)
  end
end
