class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts.includes(comments: :author)
  end

  def show
    @post = Post.includes(comments: :author).find(params[:id]) 
    @user = @post.author   
  end
end
