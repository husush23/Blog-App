require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'User 1', photo: 'https://example.com/photo1.jpg', posts_counter: 3)
    @user2 = User.create(name: 'User 2', photo: 'https://example.com/photo2.jpg', posts_counter: 5)
  end

  describe 'User contents' do
    before(:example) { visit users_path }
    
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
      expect(page).to have_css("img[src*='photo2.jpg']")
    end

    it 'displays how many posts each user owns' do
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Number of posts: 5')
    end

    it 'displays user names as clickable links' do
      expect(page).to have_link(@user1.name, href: user_path(@user1))
      expect(page).to have_link(@user2.name, href: user_path(@user2))
    end

    it 'redirects to the user profile page when clicking on a user name' do
      click_link(@user1.name)
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
