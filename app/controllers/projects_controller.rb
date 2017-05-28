class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render json:  @projects
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end

  def create
    @program = Program.find(params[:program_id])
    @project = @program.projects.create(project_params)
    # @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      @project.errors.details
    end
  end

  def edit
    @project = Project.find(params[:id])
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
    params.require(:project).permit(:name, :description, :group, :mentor, :github_url, :status, :program_id)
  end
end
