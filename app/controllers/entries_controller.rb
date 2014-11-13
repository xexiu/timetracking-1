class EntriesController < ApplicationController
  def index
    @project = Project.friendly.find params[:project_id]
    @entries = @project.entries
  end

  def new
    @project = Project.friendly.find params[:project_id]
    @entry = @project.entries.new
  end

  def create
    @project = Project.friendly.find params[:project_id]
    @entry = @project.entries.new entry_params

    if @entry.save
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
  end

  def update
    @project = Project.friendly.find params[:project_id]
    @entry = @project.entries.find params[:id]

    if @entry.update_attributes entry_params
      redirect_to action: :show, controller: :entries, project_id: @project_id, id: @entry.id
    else
      render 'edit'
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

end
