FactoryGirl.define do
  factory :user do
    login { generate :string }
    email
    password {generate :string }
    password_confirmation { password }

    after(:build) do |u|
      u.activate
    end
  end
end
