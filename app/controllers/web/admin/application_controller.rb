class Web::Admin::ApplicationController < Web::ApplicationController
  before_filter :required_basic_auth! if !Rails.env.test?
end
