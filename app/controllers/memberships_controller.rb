class MembershipsController < ApplicationController
  before_action :set_membership, only: [:accept_membership, :show, :deny_membership, :destroy]
  before_action :set_team, only: [:new, :create]

  def new
    @membership = Membership.new
    @users = User.where.not(id: current_user.id)
    @userlist = @users - @team.users
  end

  def create
    if params[:membership]
      @membership = Membership.new(membership_params)
      @membership.team = @team
      if @membership.save
        redirect_to @team, notice: 'Teamuitnodiging verstuurd'
      else
        redirect_to @team, notice: 'Teamuitnodiging mislukt'
      end
    else
      redirect_to @team, notice: 'Er is niemand uitgenodigd'
    end
  end

  def accept_membership
    @membership.accepted = true
    if @membership.save
      redirect_to @membership.team, notice: 'Ingeschreven voor team'
    else
      redirect_to root_path, notice: 'Inschrijven mislukt'
    end
  end

  def deny_membership
    @membership.destroy
    redirect_to root_path, notice: 'Uitnodiging geweigerd'
  end

  def destroy
    if @membership.check_if_team_owner(current_user)
      @membership.team.destroy
    end
    @membership.destroy
    redirect_to root_path, notice: 'Team verlaten'
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :team_id)
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end