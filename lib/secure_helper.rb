module SecureHelper

  class << self
    def generate_token
      SecureRandom.urlsafe_base64
    end
  end

end