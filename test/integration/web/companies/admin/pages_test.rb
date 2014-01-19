require 'test_helper'

class Web::Companies::Admin::PagesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @page = create "company/page", company: @company
    @attrs = attributes_for "company/page"

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#edit #update" do
    page = ::Companies::Admin::Pages::EditPage.visit(id: @page.id)
    page.update(@attrs)

    @page.reload
    assert { @attrs[:name] == @page.name }
  end
end

