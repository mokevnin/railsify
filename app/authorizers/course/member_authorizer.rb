class Course::MemberAuthorizer < ApplicationAuthorizer
  class << self
    def creatable_by?(user, options)
      user.can_subscribe?(options.fetch(:course))
    end
  end
end
