class UsersController < ApplicationController
	def show
	end

	def leaderboard
		@users = User.all.order(:points).reverse
	end

  def leaderboard_normal_questions
    @users = User.all.order(:points).reverse
  end

  def leaderboard_choose_image
    @users = User.all.order(:points).reverse
  end

  def leaderboard_write_word
    @users = User.all.order(:points).reverse 
  end

	def invites
		@memberships = current_user.memberships
	end
end