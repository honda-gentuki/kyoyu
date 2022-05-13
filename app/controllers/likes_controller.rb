class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like, only: [:create, :destroy]

  def create
    like = Like.create(user_id: user.id, post_id: post.id)
  end

  def destroy
    like = Like.find_by(user_id: user.id, post_id: post.id)
    like.destroy
  end

  private

  def set_like
    user = current_user
    post = Post.find(params[:post_id])
  end
end
