class InvitationsController < ApplicationController

  def create
    @invited_user = User.find_by(email: params[:invitation][:email])
    @team = find_team(params[:team_id])
    if @invited_user
      InvitationMailer.delay.team_invitation(@invited_user, @team)
    else
      @invited_user = User.create(email: params[:invitation][:email], first_name: "placeholder", last_name: "placeholder", username: "placeholder{rand(9999999999999)}", password: "placeholder")
      puts @invited_user.email
      puts @invited_user.id
      InvitationMailer.delay.sign_up_invitation(@invited_user, @team)
    end
    assign_user_to_team(@team, @invited_user)
    redirect_to team_path(@team)
  end

end
