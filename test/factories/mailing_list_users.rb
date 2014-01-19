# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mailing_list_user do
    mailing_list
    user
  end
end
