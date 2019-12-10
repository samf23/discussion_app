require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #created a dummy user signup
  def setup
    @user = users(:defaultUser)
  end

  #testing that the dummy user is valid
  test 'valid user' do
    @user.save
    assert @user.valid?
  end

  #all of these following tests then make sure that the signup would not be seen as valid
  test 'invalid without a name' do
    @user.name = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without an email' do
    @user.email = nil
    refute @user.valid?, 'saved user without a name'
  end

  test 'invalid without a password' do
    @user.encrypted_password = nil
    refute @user.valid_password?(@user.encrypted_password)
  end


end
