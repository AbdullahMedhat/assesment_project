class StudentsController < ApplicationController
    def index
      @students = Student.all
      render json: @students
    end

    def show
      @student = Student.find(params[:id])
      render json: @student
    end

    def edit
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find(params[:id])
      if @student.update student_params
        redirect_to @student
      else
        @student.errors.details
      end
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
    end

    private

    def student_params
      params.require(:student).permit(:name)
    end
  end
end
