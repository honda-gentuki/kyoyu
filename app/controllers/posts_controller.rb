class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show, :edit]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @users = User.all
    @posts = Post.all.order('created_at DESC').page(params[:page])
    @posts = @posts.where('unit LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def new
    @post_form = PostForm.new
    @posts = Post.all
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    redirect_to action: :index unless @post.user_id == current_user.id
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags&.first&.tag_name
  end

  def update
    @post_form = PostForm.new(post_form_params)
    @post_form.images ||= @post.images.blobs
    if @post_form.valid?
      @post_form.update(post_form_params, @post)
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

  private

  def post_form_params
    params.require(:post_form).permit(:subject, :course, :unit, :teaching_materials, :introduction, :introduction_time, :development,
                                      :development_time, :summary, :summary_time, :tag_name, { images: [] }).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
