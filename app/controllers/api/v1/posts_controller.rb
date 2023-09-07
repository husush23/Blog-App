class Api::V1::PostsController < ApplicationController
    before_action :set_user
  
    def index
      @posts = @user.posts
      render json: @posts
    end
  
    def show
      @post = @user.posts.find(params[:id])
      render json: @post
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  end
  