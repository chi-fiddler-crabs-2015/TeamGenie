class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
    else
      flash[:notice] = "Your username and password didn't match, please try again or create a new account!"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
