class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  mix :member_role do
    def subscription_status(course)
      if learn_courses.include?(course)
        h.t('.subscribed')
      else
        h.t('.unsubscribed')
      end
    end
  end
end
