class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]

  def index
    @teams = Team.all.sort_by { |team| team.total_points }.reverse
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user
    if @team.save
      redirect_to @team, notice: 'Team aangemaakt'
    else
      render 'new', notice: 'Team aanmaken mislukt'
    end
  end

  def edit
  end

  def update
    @team.update(team_params)
    if @team.save
      redirect_to @team, notice: 'Jouw team is aangepast'
    else
      redirect_to @team, notice: 'Aanpassen mislukt'
    end
  end

  def show
    @memberships = Membership.where(accepted: true, team_id: @team.id).order(:points).reverse
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :picture)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
