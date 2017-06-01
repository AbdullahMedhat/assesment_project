class StudentsController < ApplicationController
    def index
      @students = Student.all
      render json: @students
    end

    def show
      @student = Student.find(params[:id])
      render json: @student.to_json(:include => [:submissions, :program])
    end

    def edit
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find_by(invitation_token: accept_invitation_params['invitation_token'])
      @student.update accept_invitation_params
      @student.accept_invitation!
      if @student
        redirect_to 'http://localhost:3001/'
      else
        render json: { errors: 'Invitation is invalid!' },
               status: :unprocessable_entity
      end
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
    end

    private

    def student_params
      params.require(:student).permit(:name, :gitHub_userName, :email, :bio, :submissions, :program_id,
      :password, :password_confirmation, :invitation_token)
    end

    def accept_invitation_params
      params.require(:student).permit(:password, :password_confirmation,
      :invitation_token)
    end
  end
