class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like, only: [:create, :destroy]

  def create
    like = current_user.likes.new(post_id: @post.id)
    like.save
    @post.create_notification_by(current_user)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id).destroy
  end

  private

  def set_like
    @post = Post.find(params[:post_id])
  end
end
