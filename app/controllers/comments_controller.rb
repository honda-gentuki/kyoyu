class CommentsController < ApplicationController
  def create
    if @comments = Comment.create(comment_params)
      redirect_to "/posts/#{@comments.post.id}"
    else
      render post_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end