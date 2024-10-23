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
end
