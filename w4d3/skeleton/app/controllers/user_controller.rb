class UserController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid login"]
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :session_token)
  end

end
