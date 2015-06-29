require 'test_helper'

class WordOfTheWeeksControllerTest < ActionController::TestCase
  setup :login_user, :set_word_of_the_week

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    get :show, id: @word_of_the_week.id
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @word_of_the_week.id
    assert_response :success
  end

  private

  def login_user
    sign_in users(:one)
  end

  def set_word_of_the_week
    @word_of_the_week = word_of_the_weeks(:word_of_the_week)
  end
end
