require 'test_helper'

class WordOfTheWeekReactionsControllerTest < ActionController::TestCase
  setup :login_user, :set_word_of_the_week_reaction, :set_word_of_the_week

  private

  def login_user
    sign_in users(:one)
  end

  def set_word_of_the_week_reaction
    @word_of_the_week_reaction = word_of_the_week_reactions(:reaction)
  end

  def set_word_of_the_week
    @word_of_the_week = word_of_the_weeks(:word_of_the_week)
  end
end
