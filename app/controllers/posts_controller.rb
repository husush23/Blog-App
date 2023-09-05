class PostsController < ApplicationController
  helper_method :current_user

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: :author).paginate(page: params[:page], per_page: 10)
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
    @user = User.find(params[:user_id])

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post successfully created'
    else
      redirect_to new_user_post_path(@user), alert: 'Failed to create post'
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
