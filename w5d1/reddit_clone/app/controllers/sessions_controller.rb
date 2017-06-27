class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      log_in(user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    log_out
  end
  
end
