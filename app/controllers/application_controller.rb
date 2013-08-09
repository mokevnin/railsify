class ApplicationController < ActionController::Base
  include Concerns::AuthManagment
  include Concerns::FlashHelper

  helper_method :current_user, :signed_in?

end
