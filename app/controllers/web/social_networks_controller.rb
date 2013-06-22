class Web::SocialNetworksController < ApplicationController

  def facebook
    auth_hash = request.env['omniauth.auth']
    authorization = User::Authorization.where(auth_hash.slice(:provider, :uid)).first_or_initialize

    if authorization.persisted?
      if authorization.user.inactive?
        f(:notice)
        redirect_to root_path
        return
      end

      sign_in authorization.user
      f(:success)
    else
      user = User.where(auth_hash[:info].slice(:email)).first_or_initialize

      if user.inactive?
        f(:error)
        redirect_to root_path
        return
      end

      user.authorizations << authorization

      if user.activate
        sign_in user
        f(:success)
      else
        f(:error)
      end
    end
    redirect_to root_path
  end

  def failure
    f(:error)
    redirect_to root_path
  end
end
