require 'test_helper'

class Web::Companies::Admin::MailingListsTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @mailing_list = @company.mailing_lists.last

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#index" do
    ::Companies::Admin::MailingLists::IndexPage.visit
    assert_response :ok
  end

  test "#edit #update" do
    skip
    p = ::Companies::Admin::MailingLists::EditPage.visit(id: @awaiting_teacher.id)
    p.update(attrs)

    @teacher.reload
    assert { @teacher.confirmed? }
  end

  test "switch state" do
    p = ::Companies::Admin::MailingLists::IndexPage.visit

    c = p.mailing_lists.last
    c.state_button.click
    c.event_links.first.click
    p.load
    @mailing_list.reload

    assert { @mailing_list.processed? }
  end
end
