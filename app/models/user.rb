class User < ActiveRecord::Base
  has_secure_password

  has_many :topics, foreign_key: :creator_id

  validates :email, uniqueness: true, presence: true, email: true
  validates :login, uniqueness: true, presence: true

  state_machine initial: :active do
    state :active
  end

  include UserRepository

  def to_s
    login
  end
end
