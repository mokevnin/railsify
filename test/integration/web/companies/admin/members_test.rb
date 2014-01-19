require 'test_helper'

class Web::Companies::Admin::MembersTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = @company.courses.last
    @course.members.delete_all
    member = @course.members.create user: @user
    @member = member.decorate
    @course.finish_course

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#index" do
    ::Companies::Admin::Members::IndexPage.visit
    assert_response :ok
  end

  test "#new #create" do
    user = create :user
    p = ::Companies::Admin::Members::NewPage.visit
    p.create(user, @course)

    assert { @course.member_users.include? user }
  end
end
