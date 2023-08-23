class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  attribute :title, :text
  attribute :text, :text
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  after_create :increment_author_posts_counter


  

  def increment_author_posts_counter
    puts 'Callback invoked!'
    author.increment!(:posts_counter)
  end

    def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
