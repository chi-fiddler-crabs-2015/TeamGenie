class MembershipsController < ApplicationController

  def mark_paid
    membership = Membership.find_by(id: params[:membership_id])
    membership.amount_owed = 0
    membership.save
    redirect_to team_roster_path(membership.team) and return
  end

end
