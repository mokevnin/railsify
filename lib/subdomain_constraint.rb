class SubdomainConstraint
  def self.matches?(request)
    request.env['X-COMPANY-LOGIN'] \
      || request.subdomain.present? && request.subdomain != 'www'
  end
end
