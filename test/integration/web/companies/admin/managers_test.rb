require 'test_helper'

class Web::Companies::Admin::ManagersTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    manager = create "company/manager", company: @company
    @manager = manager.decorate

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#index" do
    ::Companies::Admin::Managers::IndexPage.visit
    assert_response :ok
  end

  test '#new #create' do
    user = create :user

    p = ::Companies::Admin::Managers::NewPage.visit
    p.create(user)

    assert { @company.manager_users.include?(user) }
  end

  test '#index #destroy' do
    p = ::Companies::Admin::Managers::IndexPage.visit
    p.destroy(@manager)

    assert { @company.managers.exclude?(@manager) }
  end
end
