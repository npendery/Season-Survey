class UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.role = 'admin'
    render users_path
    flash[:notice] = "User Updated"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = "User deleted."
    redirect_to users_path
  end

  protected
  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
