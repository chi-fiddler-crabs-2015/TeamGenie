class MembershipsController < ApplicationController

  def mark_paid
    membership = Membership.find_by(id: params[:membership_id])
    team = Team.find_by(id: params[:team_id])
    team.paid_dues += membership.amount_owed
    membership.amount_owed = 0
    membership.save
    team.save
    redirect_to team_roster_path(membership.team) and return
  end

  def destroy
    membership = Membership.find_by(id: params[:id])
    membership.destroy
    redirect_to team_roster_path(params[:team_id])
  end

end
