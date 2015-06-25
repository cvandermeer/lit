require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup :login_user, :set_user
 
  test 'should get show' do
    get :show, id: @user.id
    assert_response :success
  end

  test 'should get leaderboard' do
    get :leaderboard
    assert_response :success 
  end

  test 'should get leaderboard choose image' do
    get :leaderboard_choose_image
    assert_response :success
  end

  test 'should get leaderboard normal questions' do
    get :leaderboard_normal_questions
    assert_response :success
  end

  test 'should get leaderboard write word' do
    get :leaderboard_write_word
    assert_response :success
  end

  private
    def login_user 
      sign_in users(:one)
    end

    def set_user
      @user = users(:one) 
    end
end