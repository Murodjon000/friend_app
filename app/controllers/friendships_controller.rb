class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = User.find(params[:user_id])
    current_user.send_friend_request_to(@user)
    redirect_to root_path
    flash[:success] = 'Invitation send to friend request'
  end
  
  def update
    @user = User.find(params[:user_id])
    current_user.accept_friend_request(@user)
    redirect_to root_path
    flash[:success] = 'Invitation accepted'
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.delete_friend_request(@user)
    redirect_to root_path
    flash[:notice] = 'Invitation rejected'
  end
end
  