require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://images3.alphacoders.com/690/690494.jpg',
      bio: 'test_bio1',
      posts_counter: 1
    )
  end

  let!(:posts) do
    [
      Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 1, likes_counter: 1),
      Post.create(author: user1, title: 'Post 2', text: 'Post 2 content', comments_counter: 2, likes_counter: 2),
      Post.create(author: user1, title: 'Post 3', text: 'Post 3 content', comments_counter: 3, likes_counter: 3)
    ]
  end

  describe 'show user and post details' do
    before(:example) do
      visit user_path(user1)
    end

    it 'displays user information' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.posts_counter)
      expect(page).to have_content(user1.bio)
      expect(page).to have_selector("img[src='#{user1.photo}']")
    end
    it 'should have a see all posts button' do
      expect(page).to have_link('See all posts')
    end
    it 'should redirect to the user posts page when the see all posts button is clicked' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(user1))
    end

    it 'displays user\'s first 3 posts' do
      posts.take(3).each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end

    it 'displays user posts' do
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
    end
  end
end
