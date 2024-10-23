# The CommentsController is the interface for all RESTful requests to comments
# for a given project
class CommentsController < ApplicationController
  before_action :set_project
  def create
    @comment = project.comments.new(comment_params)

    if comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:alert] = 'The comment could not be saved, please try again or contact support.'
    end

    redirect_to project_path(project)
  end

  private

  attr_reader :project, :comment

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
