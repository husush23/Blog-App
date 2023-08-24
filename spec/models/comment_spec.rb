require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe')
    post = Post.create(author: user, title: 'My Post', text: 'This is my post content.')
    comment = Comment.new(author: user, post:, text: 'Great post!')
    expect(comment).to be_valid
  end

  it 'is not valid without text' do
    comment = Comment.new(text: nil)
    expect(comment).not_to be_valid
  end
end
