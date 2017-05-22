# class Program

class ProgramsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @programs = Program.all
    render json:  @programs
  end

  def show
    @progam = Program.find(params[:id])
    render json:  @program
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to @program
    else
      @program.errors.details
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    if @program.update program_params
      redirect_to @program
    else
      @program.errors.details
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
  end

  private
  def program_params
    params.require(:program).permit(:name, :startdate, :enddate, :description)
  end
end