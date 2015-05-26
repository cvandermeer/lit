require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not create user without any input' do
    user = User.new
    assert_not user.save, 'Saved a user without input'
  end
end