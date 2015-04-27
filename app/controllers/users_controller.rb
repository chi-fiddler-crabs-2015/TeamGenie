class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    update_phone(@user)
    if @user.save
      UserMailer.delay.welcome_email(@user)
      session[:user_id] = @user.id
      redirect_to teams_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def join_from_invitation
    @team = find_team(params[:team_id])
    render 'join_from_invitation'
  end

  def create_user_from_invitation
    user = User.new(user_params)
    @team = find_team(params[:user][:team_id])
    if user.save && @team
      assign_user_to_team(@team, user)
      session[:user_id] = user.id
      redirect_to team_path(@team)
    else
      @errors = user.errors.full_messages
      render 'join_from_invitation'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :birthday, :phone_number)
  end

  def update_phone(user)
    if user.phone_number != nil
      phone_number = user.phone_number.gsub(/[^0-9]/, '').insert(0, "1")
      user.update_attributes(phone_number: phone_number)
    end
  end

end
