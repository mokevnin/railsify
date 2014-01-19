require 'test_helper'

class Web::SocialNetworksControllerTest < ActionController::TestCase
  setup do
    @auth_hash = generate(:facebook_auth_hash)
    request.env['omniauth.auth'] = OmniAuth::AuthHash::InfoHash.new @auth_hash
  end

  test "facebook with new user" do
    get :facebook
    assert_response :redirect

    user = User.find_by(@auth_hash[:info].extract(:email))

    assert { user }
    assert { user.authorizations.any? }
    assert { signed_in? }
  end

  test "facebook with exists user" do
    user = create :user, email: @auth_hash[:info][:email]

    get :facebook
    assert_response :redirect

    assert { signed_in? }
    assert { user.authorizations.any? }
  end
end
