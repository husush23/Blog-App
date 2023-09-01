class LikesController < ApplicationController
  def create
    like = Post.find(params[:post_id]).likes.new(author: current_user)
    if like.save
      flash[:success] = 'Post liked'
    else
      flash.now[:error] = 'Error: Failed to like post'
    end
    redirect_back(fallback_location: users_path)
  end
end
