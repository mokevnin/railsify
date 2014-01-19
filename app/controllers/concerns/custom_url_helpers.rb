module Concerns
  module CustomUrlHelpers
    def sign_in_via_social_network_cpath(provider)
      "/auth/#{provider}"
    end
  end
end
