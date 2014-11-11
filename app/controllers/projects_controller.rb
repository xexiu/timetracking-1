class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(10)
    render 'no_projects' if @projects.empty?
  end

  def show
    unless @project = Project.find_by(id: params[:id])
    #        = /pojects/:id
    render 'no_projects_found'
    # /no_projects_found.html.erb
    end
  end

  def total_worked(m,y,name)
    p = Project.find_by name: name
    p.total_hours_in_month(m, y)
  end

end
