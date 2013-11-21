#NOTE http://mokevnin.github.io/blog/2012/10/17/custom-url-slash-path-helpers/
module Concerns
  module CustomUrlHelper
    def sign_in_via_social_network_cpath(provider)
      "/auth/#{provider}"
    end
  end
end
