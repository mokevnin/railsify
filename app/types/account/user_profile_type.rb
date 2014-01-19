class Account::UserProfileType < User
  include ApplicationType

  permit :first_name, :last_name, :middle_name, :avatar, :avatar_cache, :description, :birthday
end
