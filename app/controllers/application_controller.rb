class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def users
    @users = User.all
    @user = User.find_by(params[:user_id])

    if current_user
      @users.reject { |user| user == current_user }
    end
  end


  before_action :permitted_params, if: :devise_controller?
  
  protected

  def permitted_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
