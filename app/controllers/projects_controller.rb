class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(10)
    render 'no_projects' if @projects.empty?
  end

  def show
    unless @project = Project.friendly.find(params[:id])
    render 'no_projects_found'
    end
  end

end
