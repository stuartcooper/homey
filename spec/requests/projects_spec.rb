require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  let!(:project) { create(:project) }

  describe 'GET /index' do
    it 'returns http success' do
      get projects_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get projects_path(project)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    context 'with valid attributes' do
      it 'updates the project and returns http success' do
        create(:comment, project: project)

        patch project_path(project), params: { project: { status: 'completed' } }

        expect(response).to have_http_status(:found)
        follow_redirect!
        expect(response).to have_http_status(:success)
        expect(project.reload.status).to eq('completed')
      end
    end
  end
end
