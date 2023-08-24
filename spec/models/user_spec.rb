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
end
