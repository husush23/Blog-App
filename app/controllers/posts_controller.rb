class PostsController < ApplicationController
  helper_method :current_user

  def show
    @post = Post.includes(comments: :author).find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post successfully created'
    else
      redirect_to new_user_post_path(@user), alert: 'Failed to create post'
    end
  end

  def liked_by?(user)
    likes.where(author: user).exists?
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
