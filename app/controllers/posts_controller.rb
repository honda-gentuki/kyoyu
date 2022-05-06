class PostsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @post = Post.new
  end
  
end
