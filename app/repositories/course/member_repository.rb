module Course::MemberRepository
  extend ActiveSupport::Concern

  included do
    scope :by_alphabet, -> { joins(:user).order('users.first_name asc') }
  end
end

