class WordOfTheWeeksController < ApplicationController
  before_action :set_word_of_the_week, only: [:edit, :update]

  def index
    @word_of_the_weeks = WordOfTheWeek.all
  end

  def edit
  end

  def update
    @word_of_the_week.update(word_of_the_week_params)
    if @word_of_the_week.save
      redirect_to word_of_the_weeks_path, notice: 'Woord van week ' + @word_of_the_week.id.to_s + ' aangepast'
    else
      redirect_to word_of_the_weeks_path, notice: 'Aanpassen mislukt'
    end
  end

  private
    def set_word_of_the_week
      @word_of_the_week = WordOfTheWeek.find(params[:id])
    end

    def word_of_the_week_params
      params.require(:word_of_the_week).permit(:title)
    end
end
