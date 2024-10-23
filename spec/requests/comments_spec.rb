# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let!(:project) { create(:project) }

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a comment and redirects to project show page' do
        post project_comments_path(project), params: { comment: { body: 'New comment' } }

        expect(response).to have_http_status(:found)
        follow_redirect!

        expect(response).to have_http_status(:success)
        expect(response.body).to include('Comment was successfully created.')
        expect(Comment.last.body).to eq('New comment')
        expect(Comment.last.project).to eq(project)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a comment and redirects to project show page if body is nil' do
        post project_comments_path(project), params: { comment: { body: nil } }

        expect(response).to redirect_to(project_path(project))
        expect(Comment.count).to eq(0)
      end

      it 'does not create a comment and redirects to project show page if body is a blank string' do
        post project_comments_path(project), params: { comment: { body: '' } }

        expect(response).to redirect_to(project_path(project))
        expect(Comment.count).to eq(0)
      end
    end
  end

  describe 'Project not found' do
    it 'returns 404 for a non-existent project' do
      post project_comments_path('non-existent-id'), params: { comment: { body: 'New comment' } }

      expect(response).to have_http_status(:not_found)
    end
  end
end
