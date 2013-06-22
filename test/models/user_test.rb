require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create :user
  end

  test 'should set confirmation' do
    assert_in_delta Time.current.to_i, @user.confirmed_at.to_i
  end

end
