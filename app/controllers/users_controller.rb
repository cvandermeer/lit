class UsersController < ApplicationController
  before_action :set_user, only: [:show]

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

  private

  def set_user
    @user = User.find(params[:id])
  end
end