class CommentsController < ApplicationController
  before_action :find_user_and_post, only: %i[create destroy]

  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params.merge(author: @user))

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment added successfully'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    if @comment.author == current_user
      if @comment.destroy
        flash[:success] = 'Comment deleted successfully.'
      else
        flash[:error] = 'Failed to delete the comment.'
      end
    else
      flash[:error] = "You don't have permission to delete this comment."
    end

    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def find_user_and_post
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
