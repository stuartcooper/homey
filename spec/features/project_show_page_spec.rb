require 'rails_helper'

RSpec.describe 'Project Show Page', type: :feature do
  let!(:project) { create(:project, name: 'Test Project', created_at: 2.days.ago) }
  let!(:comment1) { create(:comment, body: 'First comment', project: project, created_at: 2.days.ago) }
  let!(:comment2) { create(:comment, body: 'Second comment', project: project, created_at: 1.day.ago) }

  before do
    visit project_path(project)
  end

  it 'displays project information' do
    expect(page).to have_content('Test Project')
    expect(page).to have_content("Created at: #{project.created_at.strftime('%d %B %Y')}")
    expect(page).to have_content(stringify_status(project.status))
  end

  it 'displays comments in descending order' do
    expect(page.body.index('Second comment')).to be < page.body.index('First comment')
  end
end
