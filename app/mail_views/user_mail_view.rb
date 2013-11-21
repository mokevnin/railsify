class UserMailView < ApplicationMailView
  mail :confirmation_instructions do
    user = build :user
    generate user
  end
end
