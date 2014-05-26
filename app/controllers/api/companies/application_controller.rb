class Api::Companies::ApplicationController < Api::ApplicationController
  def resource_company
    @company ||= Company.find_by!(login: request.subdomain)
  end
end
