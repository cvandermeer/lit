class UsersController < ApplicationController
	
	def leaderboard
			@users = User.all
	end
end