# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Clean out any existing data
Comment.destroy_all
Project.destroy_all

puts 'Seeding 10 projects with random comments...'
10.times do
  project = Project.create!(
    name: Faker::App.name,
    status: Project::VALID_STATUSES.sample
  )

  first_comment_created_at = 1.year.ago
  comments_to_create = rand(3..10)

  comments_to_create.times do |i|
    # create timeline of created_at dates to illustrate history
    created_at = first_comment_created_at + (i * (365.0 / comments_to_create)).days
    project.comments.create!(
      body: Faker::Lorem.paragraph_by_chars(number: 200),
      created_at: created_at
    )
  end
end

puts 'Seeded 10 projects with random comments.'
