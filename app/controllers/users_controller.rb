class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to teams_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :birthday, :phone_number)
  end

end
