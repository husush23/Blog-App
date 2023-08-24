require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe')
    post = Post.new(author: user, title: 'My Post', text: 'This is my post content.')
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).not_to be_valid
  end

  it 'is not valid with a blank title' do
    post = Post.new(title: '')
    expect(post).not_to be_valid
  end

  it 'is not valid with a title exceeding 250 characters' do
    long_title = 'a' * 251
    post = Post.new(title: long_title)
    expect(post).not_to be_valid
  end

  it 'is valid with a zero comments_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(author: user, title: 'My Post', text: 'This is my post content.', comments_counter: 0)
    expect(post).to be_valid
  end

  it 'is valid with a positive comments_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(author: user, title: 'My Post', text: 'This is my post content.', comments_counter: 5)
    expect(post).to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(author: user, title: 'My Post', text: 'This is my post content.', comments_counter: -1)
    expect(post).not_to be_valid
  end

  it 'is valid with a zero likes_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(author: user, title: 'My Post', text: 'This is my post content.', likes_counter: 0)
    expect(post).to be_valid
  end

  it 'is valid with a positive likes_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(author: user, title: 'My Post', text: 'This is my post content.', likes_counter: 5)
    expect(post).to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(author: user, title: 'My Post', text: 'This is my post content.', likes_counter: -1)
    expect(post).not_to be_valid
  end
end
