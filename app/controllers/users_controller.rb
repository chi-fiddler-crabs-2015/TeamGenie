class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.delay.welcome_email(@user)
      session[:user_id] = @user.id
      redirect_to teams_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    @user.update_attributes(user_params)
    session[:user_id] = @user.id
    redirect_to teams_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :birthday, :phone_number)
  end

end
