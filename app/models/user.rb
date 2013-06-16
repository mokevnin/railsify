class User < ActiveRecord::Base
  include UserRepository

  validates :email, uniqueness: true, presence: true, email: true
  validates :login, uniqueness: true, presence: true

  state_machine initial: :new do
    state :new
    state :active

    event :activate do
      transition new: :active
    end
  end

  def to_s
    login
  end
end
