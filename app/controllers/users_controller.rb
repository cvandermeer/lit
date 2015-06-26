class UsersController < ApplicationController
  before_action :set_user, only: [:show, :make_admin, :destroy]
  before_action :check_admin, only: [:make_admin, :index, :destroy]

	def show
    @frysk_score = @user.get_back_all(1)
    @english_score = @user.get_back_all(2)
    @dutch_score = @user.get_back_all(3)
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
		@memberships = current_user.memberships.where(accepted: nil)
	end

  def index
    @users = User.all.order(:name)
  end

  def make_admin
    @user.admin = true
    @user.save
    redirect_to users_path, notice: 'Gebruiker admin gemaakt'
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Gebruiker verwijderd!'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def check_admin
      if !current_user.admin == true
        redirect_to root_path, notice: 'Je hebt hier niet genoeg rechten voor!'
      end
    end

end