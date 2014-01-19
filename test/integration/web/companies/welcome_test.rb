require 'test_helper'

class Web::Companies::WelcomeTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#create" do
    p = ::Companies::Welcome::IndexPage.visit
    p.teacher_suggestion_link.click
    p.wait_for_ajax

    user = @company.teachers.find_by!(user: @user)
    assert { user.awaiting? }
  end
end

