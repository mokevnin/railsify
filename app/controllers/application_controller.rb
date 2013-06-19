class ApplicationController < ActionController::Base
  include AuthHelper
  include FlashHelper

  helper_method :current_user, :signed_in?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
