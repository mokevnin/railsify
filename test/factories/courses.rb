# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    creator
    company
    name { generate :string }

    after :build do |c|
      u = c.creator
      c.lessons << build('course/lesson', course: c)
      c.lessons << build('course/lesson', start: (Time.current - 1.day), course: c)
      c.lessons << build('course/lesson', start: (Time.current + 2.hours), course: c)
      c.reviews << build('course/review', course: c, creator: u)
      c.mailing_lists << build('mailing_list', course: c, creator: u)

      c.publish
    end

    after :create do |c|
      u = c.creator
      c.members.create user: u
      c.teachers.create company_teacher: c.company.teachers.first
    end
  end

  factory :offline_course, parent: :course, class: OfflineCourse do

  end

  factory :online_course, parent: :course, class: OnlineCourse do

  end
end
