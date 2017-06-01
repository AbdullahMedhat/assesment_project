class SubmissionsController < ApplicationController
  # before_filter: authenticate_student

  def index
    if params[:project_id]
      @submissions = Submission.where(project_id: params[:project_id])
    else
      @submissions = Submission.all
    end
    render json: @submissions.to_json({include: {student: {only: [:name, :id]}}, methods: :status})
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.grade = 1
    # @submission.student = current_student
    if @submission.save
      render json: @submissions
    else
      render json: @submission.errors.details
    end
  end

  def show
    @submission = Submission.find(params[:id])
    render json:  @submission
  end

  def claim
    @submission = submission.find(params[:id])
    # @submission.mentor_id = current_mentor
  end

  private

  def submission_params
    params.require(:submission).permit(:git_url, :info, :feedback, :grade, :student_id, :project_id)
  end
end
