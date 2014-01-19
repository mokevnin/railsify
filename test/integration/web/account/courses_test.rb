require 'test_helper'

class Web::Account::CoursesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    ::Sessions::NewPage.sign_in(@user)
  end

  test "#index" do
    ::Account::Courses::IndexPage.visit
    assert_response :ok
  end

end
