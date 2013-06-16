FactoryGirl.define do
  factory :user do
    login
    email

    after(:create) do |u|
      u.activate
    end
  end
end
