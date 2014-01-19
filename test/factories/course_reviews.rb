# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'course/review' do
    creator
    course
    body
  end
end
