FactoryGirl.define do
  sequence :string do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end
end
