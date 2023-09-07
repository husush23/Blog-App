class PostsController < ApplicationController
  load_and_authorize_resource except: %i[index show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: :author).paginate(page: params[:page], per_page: 10)
    @can_delete_posts = can?(:delete, Post)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(comments: :author).find(params[:id])
    @new_like = Like.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
  
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post successfully created'
    else
      flash.now[:alert] = 'Failed to create post'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
      
      if @post.destroy
      flash[:success] = "Post deleted successfully."
    else
      flash[:error] = "You don't have permission to delete this post."
    end
    
    redirect_to root_path 
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
