require 'test_helper'

class Web::Companies::TeachersTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @teacher = @company.teachers.last

    subdomain @company.login
  end

  test "#index" do
    ::Companies::Teachers::IndexPage.visit
    assert_response :ok
  end

  test "#show" do
    ::Companies::Teachers::ShowPage.visit id: @teacher.id
    assert_response :ok
  end
end
