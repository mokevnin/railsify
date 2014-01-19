require 'test_helper'

class Web::Companies::Admin::PagesControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user

    @attrs = attributes_for 'company/page'
    @company = create :company, creator: user
    @page = create 'company/page', company: @company

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
    get :edit, id: @page.id
    assert_response :success
  end

  test "create" do
    post :create, company_page: @attrs
    assert_response :redirect

    page = @company.pages.where(@attrs.extract(:name)).first
    assert { page }
  end

  test "update" do
    patch :update, id: @page.id, company_page: @attrs
    assert_response :redirect

    @page.reload

    assert { @attrs[:name] == @page.name }
  end
end
