# frozen_string_literal: true

# The Project model represents the entirety of a project. It tracks the status and ensures that status is a valid input
class Project < ApplicationRecord
  VALID_STATUSES = %w[created planning in_progress in_review completed].freeze

  validates :status, inclusion: { in: VALID_STATUSES }

  has_many :comments, dependent: :destroy
end
