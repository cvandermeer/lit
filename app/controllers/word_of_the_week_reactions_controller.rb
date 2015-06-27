class WordOfTheWeekReactionsController < ApplicationController
  def new
    @word_of_the_week_reaction = WordOfTheWeekReaction.new
  end

  def create
    @word_of_the_week_reaction = WordOfTheWeekReaction.new(word_of_the_week_reaction_params)
    @word_of_the_week_reaction.user = current_user
    if @word_of_the_week_reaction.save
      redirect_to @word_of_the_week_reaction.word_of_the_week, notice: 'Reactie toegevoegd'
    else
      render :new, notice: 'Reactie mislukt'
    end
  end

  private

  def word_of_the_week_reaction_params
    params.require(:word_of_the_week_reaction).permit(:title,
                                                      :word_of_the_week_id)
  end
end
