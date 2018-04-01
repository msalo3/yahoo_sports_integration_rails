class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Thanks for signing up for The Weekly Puck!"
      redirect_to @user
    else
      @messages = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def update
  end

  def delete
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
