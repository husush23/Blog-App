class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notic: 'User was successfully created'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(name:, photo:, bio:)
  end
end
