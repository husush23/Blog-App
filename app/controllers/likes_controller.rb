class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    
    # Check if the user has already liked the post
    existing_like = Like.find_by(post: @post, author: current_user)
    
    if existing_like
      flash[:alert] = 'You have already liked this post.'
    else
      like = @post.likes.new(author: current_user)
      
      if like.save
        flash[:success] = 'Post liked successfully.'
      else
        flash[:error] = 'Error: Failed to like post.'
      end
    end
    
    redirect_to user_post_path(@post.author, @post)
  end
end
