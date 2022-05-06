class PostsController < ApplicationController
  def index
    @user = User.all
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
  params.require(:post).permit(:subject, :course, :unit, :teaching_materials, :introduction, :introduction_time, :development, :development_time, :summary, :summary_time, :image).merge(user_id: current_user.id)
end