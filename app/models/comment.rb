# frozen_string_literal: true

# The Comment model belongs to project. It allows users to record their input to a project.
# It also records any status change to a project
class Comment < ApplicationRecord
  belongs_to :project

  validates :body, presence: true
end
