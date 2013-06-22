class ApplicationController < ActionController::Base
  include AuthHelper
  include FlashHelper

  helper_method :current_user, :signed_in?

end
