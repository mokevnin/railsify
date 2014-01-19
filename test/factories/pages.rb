# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    name
    slug
    body
    state_event :publish
  end
end
