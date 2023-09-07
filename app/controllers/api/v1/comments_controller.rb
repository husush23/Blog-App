class Api::V1::CommentsController < ApplicationController
    before_action :set_user
    before_action :set_post
  
    def index
      @comments = @post.comments
      render json: @comments
    end
  
    def show
      @comment = @post.comments.find(params[:id])
      render json: @comment
    end
  
    def create
      @comment = @post.comments.build(comment_params)
      @comment.author = @user
  
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_post
      @post = @user.posts.find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  curl -X POST -H "Content-Type: application/json" -d '{"comment": {"text": "This is a new comment"}}' http://localhost:3000/api/v1/users/1/posts/1/comments
