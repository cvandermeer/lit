require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  setup :login_user

  test 'should get home' do
    get :home
    assert_response :success
  end

  test 'should get choose game' do
    get :choose_game
    assert_response :success
  end

  test 'should get pick category' do
    get :pick_category
    assert_response :success
  end

  test 'should get pick language' do
    get :pick_language
    assert_response :success
  end

  private

  def login_user
    sign_in users(:one)
  end
end
