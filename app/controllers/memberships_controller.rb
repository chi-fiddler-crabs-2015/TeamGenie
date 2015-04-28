class MembershipsController < ApplicationController
  # skip_before_filter :verify_authenticity_token, :only => :mark_paid
  before_action :current_user

  def mark_paid
    membership = Membership.find_by(id: params[:membership_id])
    team = Team.find_by(id: params[:team_id])
    team.paid_dues += membership.amount_owed
    membership.update_attributes(amount_owed: 0, paid: true, amount_paid: membership.amount_owed)
    team.save
    respond_to do |format|
      format.js do
        render partial: 'teams/paid_unpaid', locals: {membership: membership}, layout: false
      end
    end
  end

  def mark_unpaid
    membership = Membership.find_by(id: params[:membership_id])
    membership.update_attributes(paid: false, amount_owed: membership.amount_paid, amount_paid: 0)
    respond_to do |format|
      format.js do
        render partial: 'teams/paid_unpaid', locals: {membership: membership}, layout: false
      end
    end
  end

  def update
    membership = Membership.find_by(id: params[:id])
    membership.update_attributes(amount_owed: params[:membership][:amount_owed])
    redirect_to :back
  end

  def destroy
    team = Team.find_by(id: params[:team_id])
    team_captain(team)
    membership = Membership.find_by(id: params[:id])
    membership.destroy
    redirect_to team_roster_path(params[:team_id])
  end

end
