class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user.page(params[:page]).per(3).reverse_order
  end
end
