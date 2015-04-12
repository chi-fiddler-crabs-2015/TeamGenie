class InvitationsController < ApplicationController

  def create
    @invited_user = User.find_by(email: params[:invitation][:email])
    @team = find_team(params[:team_id])
    team_captain(@team)
    if @invited_user
      InvitationMailer.delay.team_invitation(@invited_user, @team)
      assign_user_to_team(@team, @invited_user)
    else
      new_user = User.create(email: params[:invitation][:email], first_name: "Waiting For User", last_name: " to Sign Up", username: "placeholder#{rand(9999999999999)}", password: "placeholder", phone_number: '1111111111')
      if new_user.valid?
        InvitationMailer.delay.sign_up_invitation(new_user, @team)
        assign_user_to_team(@team, new_user)
      end
    end
    render :nothing => true
  end

end
