class CourseAuthorizer < ApplicationAuthorizer
  class << self
    # def creatable_by?(user, options)
    #   company = options[:for]
    #   company.manager_users.include?(user)
    #   || company.teachers.include?(user)
    # end

    def readable_by?(user)
      true
    end

    def updatable_by?(user, options)
      company = options[:for]
      company.creator == user || company.teachers.confirmed.exists?(user: user)
    end
  end

  def reviewable_by?(user)
    return false if user.guest?
    resource.started? || resource.course_finished?
  end

  def updatable_by?(user)
    return false if user.guest?

    resource.company.manager_users.include?(user) ||
    resource.company.teachers.confirmed.exists?(user: user) &&
    resource.teacher_users.include?(user)
  end

  def subscribable_by?(user)
    return false if user.guest?

    user.learn_courses.exclude?(resource) \
    && resource.subscription_allowed? \
    && resource.course_not_finished? \
    && resource.has_seat?
  end
end
