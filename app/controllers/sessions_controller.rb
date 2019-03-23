class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email and/or password"
      render 'new'
    end
  end

  def custom
    @yahoo_stuff = params
  end

  def delete
    log_out
    redirect_to root_url
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
