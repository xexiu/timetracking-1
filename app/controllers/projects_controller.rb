class ProjectsController < ApplicationController
  helper_method :project
  before_action :authenticate_user!
  def index
    @projects = current_user.projects.last_created_projects(10)
    render 'no_projects' if @projects.empty?
  end

  # def show
  #   unless @project = current_user.projects.friendly.find(params[:id])
  #   render 'no_projects_found'
  #   end
  # end

  private
  def project
    @project ||= current_user.projects.find_by id: params[:id]
  end

end
