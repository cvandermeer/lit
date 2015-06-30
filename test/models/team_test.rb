require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'should not create team without any input' do
    team = Team.new
    assert_not team.save, 'Saved a team without input'
  end

  test 'should not create team without an user id' do
    team = Team.new(name: 'My team')
    assert_not team.save, 'Saved a team without a user id'
  end
end
