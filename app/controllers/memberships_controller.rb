class MembershipsController < ApplicationController

  def mark_paid
    membership = Membership.find_by(id: params[:membership_id])
    team = Team.find_by(id: params[:team_id])
    team.paid_dues += membership.amount_owed
    membership.update_attributes(amount_owed: 0, paid: true, amount_paid: membership.amount_owed)
    team.save
    redirect_to team_roster_path(membership.team) and return
  end

  def mark_unpaid
    membership = Membership.find_by(id: params[:membership_id])
    membership.update_attributes(paid: false, amount_owed: membership.amount_paid, amount_paid: 0)
    redirect_to team_roster_path(membership.team) and return
  end

  def destroy
    membership = Membership.find_by(id: params[:id])
    membership.destroy
    redirect_to team_roster_path(params[:team_id])
  end

end
