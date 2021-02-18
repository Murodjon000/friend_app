class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(post_id: params[:post_id])

    if @like.save
      flash[:success] = 'You liked the post'
      redirect_to posts_path
    else
      flash[:alert] = 'You cannot like this post'
      redirect_to posts_path
    end
  end

  def destroy
    like = Like.find_by(post_id: params[:post_id], user: current_user, id: params[:id])

    if like
        like.destroy
        flash[:success] = 'You disliked the post'
        redirect_to posts_path
    else
        flash[:alert] = 'You cannot dislike this post'
        redirect_to posts_path
    end
  end
end