class Api::Companies::ApplicationController < Api::ApplicationController
  def resource_company
    @company ||= Company.where(login: request.subdomain).first!
  end
end
