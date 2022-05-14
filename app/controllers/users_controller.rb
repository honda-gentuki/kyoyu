class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_user, only: [:show, :following, :followers]

  def show
    @posts = @user.posts.page(params[:page]).reverse_order
    @following_users = @user.following
    @follower_users = @user.followers
  end

  def following
    @users = @user.following
    render 'follows'
  end

  def followers
    @users = @user.followers
    render 'followers'
  end

  def create
    @user = User.find(params[:following_id])
    current_user.follow(@user)
    # 通知の作成
    @user.create_notification_follow!(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
