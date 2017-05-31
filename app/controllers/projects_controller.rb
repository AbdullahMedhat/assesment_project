class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render json:  @projects
  end

  def show
    @project = Project.find(params[:id])
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    render json: @project
  end

  def create
    @program = Program.find(params[:program_id])
    @project = @program.projects.create(project_params)
    if @project.save
        render json: @project
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    render json: @project.to_json(:include => [:submissions, :students])
  end

  def create
   @program = Program.find(params[:project][:program_id])
    @project = @program.projects.create(project_params)
    if @project.save
        redirect_to @project
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    else
      @project.errors.details
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update project_params
      redirect_to @project
    else
      @project.errors.details
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private
  def project_params
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    params.require(:project).permit(:name, :description, :mentor, :github_url, :status, :program_id)
=======
    params.require(:project).permit(:name, :description, :mentors, :github_url, :status, :program_id, :submissions, :students)
>>>>>>> Stashed changes
=======
    params.require(:project).permit(:name, :description, :mentors, :github_url, :status, :program_id, :submissions, :students)
>>>>>>> Stashed changes
=======
    params.require(:project).permit(:name, :description, :mentors, :github_url, :status, :program_id, :submissions, :students)
>>>>>>> Stashed changes
  end
end
