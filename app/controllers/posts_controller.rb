class PostsController < ApplicationController
  before_action :find_user

  def index
    @posts = @user.posts.includes(comments: :author)
  end

  def show
    @post = Post.includes(comments: :author).find(params[:id])
    @user = @post.author
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
