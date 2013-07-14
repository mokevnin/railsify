# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    name
    body

    creator

    after(:build) do |t|
      t.category_hubs << create('category/hub')
    end

    after(:create) do |t|
      t.publish
    end
  end
end
