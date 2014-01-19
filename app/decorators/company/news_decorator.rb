class Company::NewsDecorator < ApplicationDecorator
  delegate_all

  def published_date
    published_at || created_at
  end
end
