require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup :login_user, :set_team

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should be able to create team' do
    assert_difference('Team.count') do
      post :create, team: { name: 'New team', user_id: @team.user.id }
    end
    assert_redirected_to Team.last
  end

  test 'should get edit' do
    get :edit, id: @team
    assert_response :success
  end

  test 'should update team' do
    patch :update, id: @team, team: { name: @team.name }
    assert_redirected_to @team
  end

  private

  def login_user
    sign_in users(:one)
  end

  def set_team
    @team = teams(:team_one)
  end
end
