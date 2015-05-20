require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  setup :login_user

  test 'should get home' do
    get :home
    assert_response :success
  end

  private
    def login_user
      sign_in users(:one)
    end
end