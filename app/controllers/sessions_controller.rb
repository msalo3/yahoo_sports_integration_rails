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
    @connection = Connection.new(access_token: auth_hash['credentials']['token'], refresh_token: auth_hash['credentials']['refresh_token'], user_id: current_user.id)

    respond_to do |format|
      if @connection.save
        format.html { redirect_to @connection, notice: 'Connection was successfully saved.' }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html { render :new }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
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
