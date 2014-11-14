class Api::ProjectsController < ApplicationController
  def index
    @projects = Project.all.includes(:entries)
  end

  def create
    @projects = Project.create(project_params)
  end

  private
  # This would need to permit
  def project_params
    params.require(:project).permit(:name)
  end

end
