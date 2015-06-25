require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup :login_user

  test 'should get index' do
    get :index
    assert_response :success
  end

  private
    def login_user
      sign_in users(:one)
    end
end