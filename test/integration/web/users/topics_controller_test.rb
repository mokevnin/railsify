require 'test_helper'

class Web::Users::TopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @topic = create(:topic, creator: @user)

    NewSessionPage.sign_in(@user)
  end

  test "#index" do
    UserTopicsPage.visit(id: @user.login)
  end

end
