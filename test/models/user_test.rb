require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not create user without any input' do
    user = User.new
    assert_not user.save, 'Saved a user without input'
  end

  test 'should not create user without a name' do
    user = User.new(email: 'admin@gmail.com')
    assert_not user.save, 'User can\'t be saved without a name'
  end

  test 'should not create user without a email' do
    user = User.new(name: 'Admin')
    assert_not user.save, 'User can\'t be saved without a email'
  end
end
