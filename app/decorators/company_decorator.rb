class CompanyDecorator < ApplicationDecorator
  delegate_all
  decorates_association :courses, scope: :published
end
