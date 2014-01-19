require 'test_helper'

class Web::Companies::Admin::ProfilesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#edit #update" do
    p = ::Companies::Admin::Profiles::EditPage.visit(id: @company.id)
    attrs = {state_event: :deactivate}
    p.update(attrs)
    @company.reload
    assert { @company.inactive? }
  end
end
