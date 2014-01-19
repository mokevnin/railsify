class Web::LocalesController < Web::ApplicationController
  def update
    session[:current_locale] = switch_locale

    try_redirect_to_back_or
  end
end
