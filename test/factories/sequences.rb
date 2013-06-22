FactoryGirl.define do
  sequence :string do |n|
    "string#{n}"
  end

  sequence :body do |n|
    "body#{n}"
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :facebook_auth_hash do
    {
      provider: 'facebook',
      uid: '1234567',
      info: {
        #TODO послать в factorygirl пул реквест чтобы работало по методу
        email: FactoryGirl.generate(:email)
      }
    }
  end
end
