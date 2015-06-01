class TeamsController < ApplicationController
	before_action :set_team, only: [:show]

	def index
		@teams = Team.all
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

	def show
	end

	private
	
	def team_params
		params.require(:team).permit(:name, :description, :picture)
	end

	def set_team
		@team = Team.find(params[:id])
	end
end