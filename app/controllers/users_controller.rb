class UsersController < ApplicationController
	def show
	end

	def leaderboard
		@users = User.all.order(:points).reverse
	end

  def leaderboard_reading
    @users = User.all.order(:points).reverse
  end

	def invites
		@memberships = current_user.memberships
	end
end