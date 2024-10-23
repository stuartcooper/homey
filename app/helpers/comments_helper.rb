module CommentsHelper

  def create_status_change_comment(starting_status:, project:)
    Comment.create(
      body: "Status change: #{stringify_status(starting_status)} to #{stringify_status(project.status)}",
      project:
    )
  end

  private

  def stringify_status(status)
    status.gsub('_', ' ').titleize
  end
end
