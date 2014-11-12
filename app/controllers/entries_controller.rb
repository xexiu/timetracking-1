class EntriesController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    @entries = @project.entries
  end

  def new
    @project = Project.find params[:project_id]
    @entry = @project.entries.new
  end
end
