require 'test_helper'

class Web::Companies::Admin::MailingListsControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user

    @company = create :company, creator: user
    @course = @company.courses.first
    @mailing_list = @course.mailing_lists.first
    @attrs = build('mailing_list', course: @course).attributes

    subdomain @company.login
  end

  test "index" do
    get :index
    assert_response :success
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "edit" do
    get :edit, id: @mailing_list.id
    assert_response :success
  end

  test "create" do
    post :create, mailing_list: @attrs
    assert_response :redirect

    mailing_list = @course.mailing_lists.where(@attrs.extract("body")).first
    assert { mailing_list }
  end

  test "update" do
    patch :update, id: @mailing_list.id, mailing_list: @attrs
    assert_response :redirect

    @mailing_list.reload

    assert { @attrs["body"] == @mailing_list.body }
  end
end
