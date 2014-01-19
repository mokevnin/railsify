class CompanyAuthorizer < ApplicationAuthorizer
  class << self
    def creatable_by?(user)
      !user.guest?
    end

    def readable_by?(user)
      true
    end
  end

  def readable_by?(user)
    resource.active? \
      || resource.managers.include?(user) \
      || resource.teachers.confirmed.exists?(user: user)
  end

  def managable_by?(user)
    return false if user.guest?
    updatable_by?(user) || resource.teachers.confirmed.exists?(user: user)
  end

  def updatable_by?(user)
    return  false if user.guest?
    resource.manager_users.include?(user)
  end
end
