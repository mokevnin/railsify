class Account::CompanyEditType < Company
  include ApplicationType

  permit :name, :description, :login, :state_event, :logo, :logo_cache,
    :facebook_group_link, :public_email, :phone, domains_attributes: [:id, :name, :_destroy]
end
