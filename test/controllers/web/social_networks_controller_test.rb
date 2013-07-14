require 'test_helper'

class Web::SocialNetworksControllerTest < ActionController::TestCase
  setup do
    @auth_hash = generate(:facebook_auth_hash)
    @user = create :user
  end

  test "should get authorization with facebook" do
    @user.authorizations.create(@auth_hash.extract(:uid, :provider))

    request.env['omniauth.auth'] = @auth_hash

    get :facebook
    assert_response :redirect

    assert { signed_in? }
  end

  test "should fail authorization with facebook" do
    @user.deactivate
    @user.authorizations.create(@auth_hash.extract(:uid, :provider))

    request.env['omniauth.auth'] = @auth_hash

    get :facebook
    assert_response :redirect

    assert { !signed_in? }
  end

  test "should get failure" do
    get :failure
    assert_response :redirect
  end
end
