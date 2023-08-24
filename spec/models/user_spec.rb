require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe', bio: "Hello, I'm John.")
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).not_to be_valid
  end

  it 'is valid with a zero posts_counter' do
    user = User.new(name: 'John Doe', posts_counter: 0)
    expect(user).to be_valid
  end

  it 'is valid with a positive posts_counter' do
    user = User.new(name: 'John Doe', posts_counter: 10)
    expect(user).to be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user = User.new(name: 'John Doe', posts_counter: -1)
    expect(user).not_to be_valid
    expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
  end

  it 'returns the 3 most recent posts' do
    user = User.create(name: 'John Doe')
    post1 = Post.create(author: user, title: 'Post 1', text: 'Text 1')
    post2 = Post.create(author: user, title: 'Post 2', text: 'Text 2')
    post3 = Post.create(author: user, title: 'Post 3', text: 'Text 3')
    post4 = Post.create(author: user, title: 'Post 4', text: 'Text 4')

    recent_posts = user.recent_posts

    expect(recent_posts).to eq([post4, post3, post2])
    expect(recent_posts).not_to include(post1)
  end
end
