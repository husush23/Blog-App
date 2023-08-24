require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'Hussein Ali')
    post = Post.create(author: user, title: 'My Post', text: 'This is my post content.')
    like = Like.new(author: user, post:)
    expect(like).to be_valid
  end
end
