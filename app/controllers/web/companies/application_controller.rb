class Web::Companies::ApplicationController < Web::ApplicationController
  helper_method :resource_company

  before_filter do
    forbid(:company) unless current_user.can_read?(resource_company)

    title resource_company
  end

  private

  def resource_company
    return @company if @company
    login = request.env['X-COMPANY-LOGIN'] || request.subdomain
    @company = Company.find_by!(login: login)
  end
end
