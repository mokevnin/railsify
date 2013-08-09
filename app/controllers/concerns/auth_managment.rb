module Concerns
  module AuthManagment
    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def signed_in?
      current_user
    end

    def authenticate_user!
      unless signed_in?
        redirect_to new_session_path
      end
    end

    def current_user
      @current_user ||= User.active.where(id: session[:user_id]).first
    end
  end
end
