# The ProjectsController is the interface for all RESTful requests for Projects
class ProjectsController < ApplicationController
  include CommentsHelper

  before_action :set_project, only: %i[show update]
  def index
    @projects = Project.all
  end

  def show
    @comments = sorted_comments
    @comment = project.comments.new
  end

  def update
    starting_status = project.status
    return unless project.update(project_params)

    create_status_change_comment(starting_status:, project:)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to project, notice: 'Project status was successfully updated.' }
    end
  end

  private

  attr_reader :project

  def set_project
    @project = Project.find(params[:id])
  end

  def sorted_comments
    @sorted_comments ||= project.comments.order(created_at: :desc)
  end

  def project_params
    params.require(:project).permit(:name, :status)
  end
end
