class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id]) # Find the post by the post ID
    @user = @post.author            # Fetch the user who authored the post
  end
end
