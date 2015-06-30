require 'test_helper'

class WordOfTheWeekReactionsControllerTest < ActionController::TestCase
  setup :login_user, :set_user, :set_word_of_the_week_reaction, :set_word_of_the_week

  test 'should be able to create word of the week reaction' do
    assert_difference('WordOfTheWeekReaction.count') do
      post :create, word_of_the_week_reaction: { title: 'My reaction', word_of_the_week_id: @word_of_the_week.id, user_id: @user.id }
    end
    assert_redirected_to @word_of_the_week
  end

  private

  def login_user
    sign_in users(:one)
  end

  def set_user
    @user = users(:one)
  end

  def set_word_of_the_week_reaction
    @word_of_the_week_reaction = word_of_the_week_reactions(:reaction)
  end

  def set_word_of_the_week
    @word_of_the_week = word_of_the_weeks(:word_of_the_week)
  end
end
