require 'rails_helper'

RSpec.describe "Routes", type: :request do
  describe 'GET /' do
    it 'navigates to the root successfully' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users' do
    it 'navigates to the users index successfully' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

end
