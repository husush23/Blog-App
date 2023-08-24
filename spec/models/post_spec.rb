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
end
