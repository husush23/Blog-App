require 'rails_helper'

RSpec.describe 'Post Index View Page', type: :system do
  let!(:user1) do
    User.create(
      name: 'Test User 1',
      photo: 'https://images.example.com/i/086/5621234.jpg',
      bio: 'Test Bio 1',
      posts_counter: 1
    )
  end

  let!(:post1) do
    Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 1, likes_counter: 0)
  end

  let!(:comment1) do
    Comment.create(post: post1, author: user1, text: 'Nice comment 1!')
  end

  let!(:comment2) do
    Comment.create(post: post1, author: user1, text: 'Nice comment 2!')
  end

  let!(:comment3) do
    Comment.create(post: post1, author: user1, text: 'Nice comment 3!')
  end

  let!(:comment4) do
    Comment.create(post: post1, author: user1, text: 'Nice comment 4!')
  end

  let!(:comment5) do
    Comment.create(post: post1, author: user1, text: 'Nice comment 5!')
  end

  describe 'Show correct post for user1' do
    before(:example) do
      visit user_post_path(user1, post1)
    end

    it 'displays the post title' do
      expect(page).to have_content(post1.title)
    end

    it 'displays the post author' do
      expect(page).to have_content(user1.name)
    end

    it 'displays the number of comments' do
      expect(page).to have_content("Comments: #{post1.comments_counter}")
    end

    it 'displays the number of likes' do
      expect(page).to have_content("Likes: #{post1.likes_counter}")
    end

    it 'displays the post body' do
      expect(page).to have_content(post1.text)
    end

    it 'displays the username of each commenter' do
      expect(page).to have_content(comment1.author.name)
      expect(page).to have_content(comment2.author.name)
    end

    it 'displays the comment left by each commenter' do
      expect(page).to have_content(comment1.text)
      expect(page).to have_content(comment2.text)
    end
  end

  describe 'Like button' do
    before(:example) do
      visit user_post_path(user1, post1)
    end

    it 'displays the like button' do
      expect(page).to have_button('Like')
    end

    it 'allows the user to like the post' do
      click_button 'Like'
      expect(page).to have_content('Likes: 1')
    end
  end
end
