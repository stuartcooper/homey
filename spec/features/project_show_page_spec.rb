# frozen_string_literal: true

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
    expect(page).to have_content(stringify_status(project.status))
  end

  it 'displays comments in descending order' do
    expect(page.body.index('Second comment')).to be < page.body.index('First comment')
  end

  it "reveals the new comment form when the 'Add New Comment' button is clicked" do
    expect(page).to have_selector("div.hidden[data-project-comments-form-target='hideable']", visible: false)
    click_button 'Add New Comment'
    expect(page).to have_selector('form')
  end

  it 'allows adding a new comment' do
    click_button 'Add New Comment'
    fill_in 'Comment', with: 'This is a new comment'
    click_button 'Submit'
    expect(page).to have_current_path(project_path(project))
    expect(page).to have_content('This is a new comment')
  end

  it 'does not allow submitting an empty comment' do
    click_button 'Add New Comment'
    fill_in 'Comment', with: ''
    click_button 'Submit'
    expect(page).to have_selector('form')
    expect(page).to have_content('The comment could not be saved, please try again or contact support')
  end
end
