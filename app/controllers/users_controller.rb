class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    # @mutual_friends = @user.mutual_friends
    # @pending_friends = @user.pending
  end
end
