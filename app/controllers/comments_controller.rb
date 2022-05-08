class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = post.find(params[:post_id])
    if @comment.save
      CommentChannel.broadcast_to @post, { comment: @comment, user: @comment.user } 
    else
      render post_path
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
