require 'test_helper'

class Web::Account::WelcomeTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    create :company, creator: @user

    ::Sessions::NewPage.sign_in(@user)
  end

  test "#edit #update" do
    ::Account::Welcome::IndexPage.visit
    assert_response :ok
  end
end
