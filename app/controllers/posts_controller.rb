class PostsController < ApplicationController
  before_action :find_user

  def index
    @posts = @user.posts.includes(comments: :author)
  end

  def show
    @post = Post.includes(comments: :author).find(params[:id])
    @user = @post.author
  end

  def new
    @user =  current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.buil(post_params)

    if @post.save
      redirect_to user_post_path(@user), notic: 'Post successfully created'
      else
        redirect_to :new, alert: 'Failed to create post'
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
