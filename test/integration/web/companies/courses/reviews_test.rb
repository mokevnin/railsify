require 'test_helper'

class Web::Companies::Courses::ReviewsTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = create :offline_course, company: @company
    @course.member_users << @user

    ::Sessions::NewPage.sign_in(@user)

    subdomain @company.login
  end

  test "#new #create" do
    p = ::Companies::Courses::ShowPage.visit id: @course.id
    saop
    p.review_link.click
    p = ::Companies::Courses::Reviews::NewPage.new
    body = generate :string
    p.create(body)

    review = @course.reviews.find_by body: body
    assert { review }
  end
end
