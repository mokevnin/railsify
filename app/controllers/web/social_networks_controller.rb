class Web::SocialNetworksController < Web::ApplicationController
  def facebook
    auth_hash = request.env['omniauth.auth']
    attrs = ActionController::Parameters.new auth_hash[:info]
    authorization = User::Authorization.where(auth_hash.extract(:provider, :uid)).first_or_initialize

    if authorization.persisted?
      user = authorization.user
    else
      user = UserFacebookType.where(attrs.extract('email'))
        .first_or_create(attrs)

      user.authorizations << authorization
    end

    if user.waiting_confirmation?
      user.confirm!
    end

    if user.active?
      sign_in user
      f(:success)
    else
      f(:error)
    end

    #FIXME прокидывать урл в facebook
    try_redirect_to_from_or root_path
  end

  def failure
    f(:error)
    redirect_to root_path
  end
end
