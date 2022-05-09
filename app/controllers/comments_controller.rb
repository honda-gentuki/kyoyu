class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    CommentChannel.broadcast_to @post, { comment: @comment, user: @comment.user } if @comment.save
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
