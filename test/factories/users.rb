# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :unconfirmed_user, class: 'User' do
    email
    password { generate :string }
    password_confirmation { password }
    first_name { generate :string }
    last_name { generate :string }
  end

  factory :creator, parent: :unconfirmed_user do
    after(:build) do |u|
      u.confirm
    end
  end

  factory :user, parent: :unconfirmed_user do
    after(:create) do |u|
      create :company, creator: u
    end

    after(:build) do |u|
      u.confirm
    end
  end
end
