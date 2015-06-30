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

  test "should update word of the week" do
    patch :update, id: @word_of_the_week, word_of_the_week: { title: @word_of_the_week.title, body: @word_of_the_week.description }
    assert_redirected_to word_of_the_weeks_path
  end

  private

  def login_user
    sign_in users(:one)
  end

  def set_word_of_the_week
    @word_of_the_week = word_of_the_weeks(:word_of_the_week)
  end
end
