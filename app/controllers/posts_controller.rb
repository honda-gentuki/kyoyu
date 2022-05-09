class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @users = User.all
    @post = Post.all.order('created_at DESC')
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

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    redirect_to action: :index unless @post.user_id == current_user.id
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
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

def set_post
  @post = Post.find(params[:id])
end
