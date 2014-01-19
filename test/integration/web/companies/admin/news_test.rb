require 'test_helper'

class Web::Companies::Admin::NewsTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @news = @company.news.last

    @attrs = attributes_for 'company/news'

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#index" do
    ::Companies::Admin::News::IndexPage.visit
    assert_response :ok
  end

  test "#new #create" do
    p = ::Companies::Admin::News::NewPage.visit
    p.create(@attrs)

    news = @company.news.find_by name: @attrs[:name]
    assert { news }
  end

  test "#edit #update" do
    p = ::Companies::Admin::News::EditPage.visit(id: @news.id)
    p.update(@attrs)

    @news.reload
    assert { @attrs[:name] == @news.name }
  end
end
