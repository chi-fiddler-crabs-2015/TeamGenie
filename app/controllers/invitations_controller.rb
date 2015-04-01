class InvitationsController < ApplicationController

  def create
    @invited_user = User.find_by(email: params[:invitation][:email])
    @team = find_team(params[:team_id])
    if @invited_user
      InvitationMailer.delay.team_invitation(@invited_user, @team)
      assign_user_to_team(@team, @invited_user)
    else
      new_user = User.create(email: params[:invitation][:email], first_name: "placeholder", last_name: "placeholder", username: "placeholder#{rand(9999999999999)}", password: "placeholder")
      if new_user.valid?
        # This side doesn't work yet.
        # puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        # puts new_user.id
        # puts new_user.email
        InvitationMailer.delay.sign_up_invitation(new_user, @team)
        assign_user_to_team(@team, new_user)
      end
    end
    redirect_to team_path(@team)
  end

end
