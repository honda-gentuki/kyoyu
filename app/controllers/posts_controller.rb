class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @users = User.all
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def post_params
  params.require(:post).permit(:subject, :course, :unit, :teaching_materials, :introduction, :introduction_time, :development,
                               :development_time, :summary, :summary_time, :image).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to new_user_session_path unless user_signed_in?
end
