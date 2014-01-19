require 'test_helper'

class Web::SessionsTest < ActionDispatch::IntegrationTest
  test "sign in" do
    user = create(:user)

    Sessions::NewPage.sign_in(user)


    #FIXME write check
    # assert { page.has_content? }
  end

  test "sign out" do

  end
end
