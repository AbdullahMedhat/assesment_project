class GroupsController < ApplicationController
    def index
      @groups = Group.all
      render json:  @groups
    end

    def show
      @group = Group.find(params[:id])
      render json:  @group
    end

    def new
      @group = Group.new
    end

    def create
      @group = Group.new(group_params)
      if @group.save
        redirect_to @group
      else
        @group.errors.details
      end
    end

    def edit
      @group = Group.find(params[:id])
    end

    def update
      @group = Group.find(params[:id])
      if @group.update group_params
        redirect_to @group
      else
        @group.errors.details
      end
    end

    def destroy
      @group = Group.find(params[:id])
      @group.destroy
    end

    private
    def group_params
      params.require(:group).permit(:name, :description, :group, :mentor, :github_url, :status)
    end
end
