# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'course/lesson' do
    course
    #creator
    name
    description
    start { Time.current + 5.days }
  end
end
