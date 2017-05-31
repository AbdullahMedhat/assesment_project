class SubmissionsController < ApplicationController
  # before_filter: authenticate_student

  def index
    @submissions = Submission.all
    render json: @submissions.to_json({include: {student: {only: [:name, :id]}}, methods: :status})
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.grade = 1
    # @submission.student = current_student
    if @submission.save
      redirect_to @submission
    else
      @submission.errors.details
    end
  end

  def show
    @submission = Submission.find(params[:id])
    render json:  @submission
  end


  def update
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(submission_params)
      render json: @submission
    else
      render json: @submission.errors.details
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:git_url, :info, :feedback, :grade, :student_id, :mentor_id, :project_id)
  end
end
