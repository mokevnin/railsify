class UserMailView < ApplicationMailView
  mail :remind_password do
    user = build :user
    generate user
  end

  mail :confirmation_instructions do
    user = build :user
    generate user
  end

  mail :join_to_course do
    member = build 'course/member'
    generate member
  end

  mail :leave_course do
    user = build 'user'
    generate user
  end

  mail :daily_digest do
    user = create :user
    course = create :offline_course
    course.member_users << user

    generate user
  end
end
