class UsersController < ApplicationController
	
	def leaderboard
			@users = User.all.order(:points).reverse
	end
end