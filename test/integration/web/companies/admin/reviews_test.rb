require 'test_helper'

class Web::Companies::Admin::ReviewsTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = @company.courses.last
    @review = @course.reviews.last

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#index" do
    ::Companies::Admin::Reviews::IndexPage.visit
    assert_response :ok
  end

  test "#edit #update" do
    p = ::Companies::Admin::Reviews::EditPage.visit(id: @review.id)
    body = 'body'
    p.update(body)

    @review.reload
    assert { @review.body == body }
  end

  test "switch state" do
    p = ::Companies::Admin::Reviews::IndexPage.visit

    c = p.reviews.first
    c.state_button.click
    c.event_links.first.click
    p.load
    @review.reload

    assert { @review.published? }
  end

end
