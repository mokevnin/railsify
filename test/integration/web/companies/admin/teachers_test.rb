require 'test_helper'

class Web::Companies::Admin::TeachersTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @teacher = @company.teachers.last
    @awaiting_teacher = create 'company_awaiting_teacher', company: @company

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#index" do
    ::Companies::Admin::Teachers::IndexPage.visit
    assert_response :ok
  end

  test "#edit #update" do
    p = ::Companies::Admin::Teachers::EditPage.visit(id: @awaiting_teacher.id)
    attrs = {state_event: :confirm}
    p.update(attrs)

    @teacher.reload
    assert { @teacher.confirmed? }
  end

  test "switch state" do
    p = ::Companies::Admin::Teachers::IndexPage.visit

    c = p.teachers.last
    c.state_button.click
    c.event_links.first.click
    p.load
    @teacher.reload

    assert { @teacher.disabled? }
  end
end
