class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    CommentChannel.broadcast_to @post, { comment: @comment, user: @comment.user } if @comment.save
    @post.create_notification_comment!(current_user, @comment.id)    
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
