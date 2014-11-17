class Api::ProjectsController < ApplicationController
  skip_before_action :verify_authencity_token
  def index
    @projects = Project.all.includes(:entries)
  end

  def create
    @projects = Project.create(project_params)
    render 'show'
  end

  def show
    @projects = Project.find(params[:id])
  end

  private
  # This would need to permit user, group, etc.
  def project_params
    params.require(:project).permit(:name)
  end

end
