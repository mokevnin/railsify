FactoryGirl.define do
  factory :user, aliases: [:creator] do
    login { generate :string }
    email
    password {generate :string }
    password_confirmation { password }

    after(:build) do |u|
      u.confirm
    end
  end
end
