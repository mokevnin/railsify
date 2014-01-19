class Web::ApplicationController < ApplicationController
  before_action :required_basic_auth! if Rails.env.staging?

  protect_from_forgery with: :exception

  helper_method :title

  def try_redirect_to_from_or(default)
    redirect_to params[:from] || default
  end

  def try_redirect_to_back_or(path = root_path)
    back = request.headers["Referer"] || path
    #NOTE sometimes request is not GET
    Rails.application.routes.recognize_path back
    redirect_to back
  rescue ActionController::RoutingError => e
    Rails.logger.debug(Term::ANSIColor.green("redirect_to back: #{e.message}"))
    redirect_to path
  end

  def title(part = nil)
    @_parts ||= []
    unless part
      return nil if @_parts.blank?
      return @_parts.reverse.join('. ')
    end
    @_parts << part
  end
end
