class CustomDomainMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    host = env['SERVER_NAME']
    #NOTE DIP principe with service locator pattern
    subdomain = Cname.resolver(host)
    if subdomain
      Rails.logger.debug(Term::ANSIColor.yellow("custom_domain subdomain: #{subdomain}"))
      #FIXME define properly handler
      domain = Company::Domain.find_by(name: host)
      Rails.logger.debug(Term::ANSIColor.yellow("custom_domain domain: #{domain}"))
      if domain
        company = domain.company
        Rails.logger.debug(Term::ANSIColor.yellow("custom_domain login: #{company.login}"))
        if subdomain.include? company.login
          # env['HTTP_X_FORWARDED_HOST'] = [host, subdomain].join(', ')
          env['X-COMPANY-LOGIN'] = company.login
        end
      end
    end
    @app.call(env)
  end
end
