require 'test_helper'

class WordOfTheWeekTest < ActiveSupport::TestCase
  test 'should not create word_of_the_week without any input' do
    word_of_the_week = WordOfTheWeek.new
    assert_not word_of_the_week.save, 'Saved a word_of_the_week without input'
  end
end
