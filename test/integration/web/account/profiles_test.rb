require 'test_helper'

class Web::Account::ProfilesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @attrs = attributes_for :user

    ::Sessions::NewPage.sign_in(@user)
  end

  test "#edit #update" do
    p = ::Profile::EditPage.visit
    p.update(@attrs)

    @user.reload
    assert { @attrs[:first_name] == @user.first_name }
  end
end
