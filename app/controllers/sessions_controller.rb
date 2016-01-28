class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    user = User.authenticate!(params[:user_name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to user_path(user.id), notice: "You've been logged in"
      else
        # @user = User.new
        flash.now[:error] = "Bad username or password"
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out"
  end

end
