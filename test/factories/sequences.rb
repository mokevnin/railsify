FactoryGirl.define do

  sequence :facebook_auth_hash do
    {
      provider: 'facebook',
      uid: '1234567',
      info: {
        email: FactoryGirl.generate(:email),
        first_name: FactoryGirl.generate(:name),
        last_name: FactoryGirl.generate(:name)
      }
    }
  end

  sequence :order do |n|
    n
  end

  sequence :string do |n|
    "string#{n}"
  end

  sequence :description do |n|
    "description#{n}"
  end

  sequence :slug do |n|
    "slug#{n}"
  end

  sequence :name, aliases: [:title] do |n|
    "name#{n}"
  end

  sequence :body do |n|
    "body#{n}"
  end

  sequence :integer do |n|
    n
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :phone do |n|
    "+7#{n % 10}"
  end

  sequence :url do |n|
    "http://site#{n}.ru"
  end
end
