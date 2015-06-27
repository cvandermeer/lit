class WordOfTheWeeksController < ApplicationController
  before_action :set_word_of_the_week, only: [:edit, :update, :show]
  before_action :check_admin, only: [:edit, :update, :index]

  def index
    @word_of_the_weeks = WordOfTheWeek.all
  end

  def show
    @word_of_the_week_reaction = WordOfTheWeekReaction.new
  end

  def edit
  end

  def update
    @word_of_the_week.update(word_of_the_week_params)
    if @word_of_the_week.save
      redirect_to word_of_the_weeks_path,
                  notice: 'Woord van
                  week ' + @word_of_the_week.id.to_s + '
                  aangepast'
    else
      redirect_to word_of_the_weeks_path, notice: 'Aanpassen mislukt'
    end
  end

  private

  def set_word_of_the_week
    @word_of_the_week = WordOfTheWeek.find(params[:id])
  end

  def word_of_the_week_params
    params.require(:word_of_the_week).permit(:title, :description)
  end

  def check_admin
    redirect_to root_path,
                notice: 'Je hebt hier niet genoeg
                rechten voor!' unless current_user.admin
  end
end
