require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before do
    # Create some sample users for testing
    @user1 = User.create(name: 'User 1', photo: 'https://example.com/photo1.jpg', posts_counter: 3)
    @user2 = User.create(name: 'User 2', photo: 'https://example.com/photo2.jpg', posts_counter: 5)

    visit users_path
  end

  it 'displays a list of users' do
    expect(page).to have_content('Users list page')
    expect(page).to have_content('User 1')
    expect(page).to have_content('User 2')

  end

  it 'displays user details' do
    expect(page).to have_content('User 1')
    expect(page).to have_content('User 2')
  end
  it 'displays photos' do
  expect(page).to have_css("img[src*='photo1.jpg']")
  end

  it 'Displays how many post each user own' do
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('Number of posts: 5')
  end
end
