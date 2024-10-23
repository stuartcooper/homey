# The ProjectsController is the interface for all RESTful requests for Projects
class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update]
  def index
    @projects = Project.all
  end

  def show
    @comments = sorted_comments
  end

  def update; end

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
