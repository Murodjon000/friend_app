class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'You commented to the post'
      redirect_to posts_path
    else
      flash[:alert] = 'Comment was not created'
      redirect_to posts_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
