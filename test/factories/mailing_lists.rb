# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mailing_list do
    creator
    course
    title
    body
  end
end
