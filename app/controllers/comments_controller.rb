class CommentsController < ApplicationController
  before_action :find_user_and_post, only: [:create]

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

  private

  def find_user_and_post
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
