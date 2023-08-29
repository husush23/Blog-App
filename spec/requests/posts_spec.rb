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

  describe 'GET index' do
    let(:user) { User.create(name: 'user1', photo: 'photo1', bio: 'bios1', posts_counter: 0) }
    before(:example) { get "/users/#{user.id}/posts" }

    it 'displays a list of posts' do
      expect(response).to have_http_status(200)
    end

    it 'renders the posts index view' do
      expect(response).to render_template('index')
    end

    it 'Contains texts/placeholders' do
      expect(response.body).to include('Posts list page here')
    end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'user1', photo: 'photo1', bio: 'bios1', posts_counter: 0) }
    let(:post) { Post.create(author: user, title: 'title1', text: 'description 1', likes_counter: 0, comments_counter: 0) }

    it 'renders and creates post successfully' do
      url = "/users/#{user.id}/posts/#{post.id}"
      get url
      expect(response).to have_http_status(200)
    end

    it 'renders the correct view template' do
      url = "/users/#{user.id}/posts/#{post.id}"
      get url
      expect(response).to render_template('show')
    end

    it 'include or display the correct place holders' do
      url = "/users/#{user.id}/posts/#{post.id}"
      get url
      expect(response.body).to include('Post details here')
    end
  end

end
