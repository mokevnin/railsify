require 'test_helper'

class CustomDomainMiddlewareTest < ActiveSupport::TestCase
  setup do
    @company = create :company
    @domain = create 'company/domain', company: @company
    @subdomain = "#{@company.login}.coursify.ru."

    app = ->(env) { env }
    @m = CustomDomainMiddleware.new app

    Resolv::DNS \
      .any_instance \
      .stubs(:getresources) \
      .returns([stub(name: @subdomain)])
  end

  test '#call' do
    env = {
      'SERVER_NAME' => @domain.name
    }
    new_env = @m.call(env)

    assert { new_env['X-COMPANY-LOGIN'] == @company.login }
  end
end
