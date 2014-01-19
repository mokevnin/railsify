class Company::ManagerDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  delegate :full_name, to: :user
end
