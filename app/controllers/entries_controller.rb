class EntriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @project = current_user.projects.friendly.find params[:project_id]
    @entries = @project.entries
  end

  def show
    @project = current_user.projects.friendly.find params[:project_id]
    @entry = @project.entries.find params[:id]
  end

  def new
    @project = current_user.projects.friendly.find params[:project_id]
    @entry = @project.entries.new
  end

  def create
    @project = current_user.projects.friendly.find params[:project_id]
    @entry = @project.entries.new entry_params

    if @entry.save
      flash[:notice] = "Project created successfully"
      UserMailer.entry_created(@project).deliver
      redirect_to project_entries_path(@project)
    else
      render 'new'
    end
  end

  def edit
    @project = current_user.projects.friendly.find params[:project_id]
    @entry = @project.entries.find params[:id]
  end

  def update
    @project = current_user.projects.friendly.find params[:project_id]
    @entry = @project.entries.find params[:id]

    if @entry.update_attributes entry_params
      redirect_to action: :show, controller: :entries, project_id: @project.id, id: @entry.id
    else
      render 'entry'
    end
  end

  def destroy
    @project = current_user.projects.friendly.find params[:project_id]
    @entry = @project.entries.find params[:id]

    if @entry.destroy
      redirect_to action: 'index'
    else
      redirect_to :back
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

end
