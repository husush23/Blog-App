require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Loading' do
    it 'eager loads the app without errors' do
      expect { Rails.application.eager_load! }.not_to raise_error
    end
  end

  describe 'GET /' do
    it 'navigates to the root successfully' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'displays correct placeholder' do
      get root_path
      expect(response.body).to include('Users page here')
    end
  end

  describe 'GET /users' do
    it 'navigates to the users index successfully' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'displays correct placeholder' do
      get users_path
      expect(response.body).to include('Users page here')
    end
  end
  describe 'GET /users/:id' do
    it 'navigates to the user show successfully' do
      get users_path(1)
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      user = User.create(name: 'user1', photo: 'photo1', bio: 'bios1', posts_counter: 0)
      get "/users/#{user[:id]}"
      expect(response).to render_template('show')
    end
  end
end
