require 'test_helper'

class WordOfTheWeekReactionTest < ActiveSupport::TestCase
  setup :set_user, :set_word_of_the_week

  test 'should not create reaction without any input' do
    reaction = WordOfTheWeekReaction.new
    assert_not reaction.save, 'Saved a reaction without input'
  end

  test 'should not create reaction without a user id' do
    reaction = WordOfTheWeekReaction.new(title: 'My reaction', word_of_the_week_id: @word_of_the_week.id)
    assert_not reaction.save, 'Saved a reaction without a user id'
  end

  test 'should not create reaction without a word of the week id' do
    reaction = WordOfTheWeekReaction.new(title: 'My reaction', user_id: @user.id)
    assert_not reaction.save, 'Saved a reaction without a user id'
  end

  private

  def set_user
    @user = users(:one)
  end

  def set_word_of_the_week
    @word_of_the_week = word_of_the_weeks(:word_of_the_week)
  end
end
