class Web::Account::ApplicationController < Web::ApplicationController
  before_action :authenticate_user!

  add_breadcrumb :index, :account_root
end
