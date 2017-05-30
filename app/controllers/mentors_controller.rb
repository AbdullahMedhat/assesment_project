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
    @mentor = Mentor.find(params[:id])
    if @mentor.update mentor_params
      redirect_to @mentor
    else
      @mentor.errors.details
    end
  end

  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.destroy
  end

  private

  def mentor_params
    params.require(:mentor).permit(:name, :email, :program_id)
  end
end
