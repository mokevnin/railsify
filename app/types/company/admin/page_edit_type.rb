class Company::Admin::PageEditType < Company::Page
  include ApplicationType

  permit :name, :body, :slug, :state_event
end
