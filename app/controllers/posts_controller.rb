class PostsController < ApplicationController
  helper_method :current_user


  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: :author)
  end

  def show
    @post = Post.includes(comments: :author).find(params[:id])
    @user = current_user
    @new_like = Like.new
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

  def create_like
    @post = Post.find(params[:id])
    @new_like = @post.likes.build(author: current_user)

    if @new_like.save
      redirect_to request.referrer, notice: 'Post liked'
    else
      redirect_to request.referrer, alert: 'Failed to like post'
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
