class User < ActiveRecord::Base
  has_secure_password

  has_many :authorizations, dependent: :destroy
  has_many :topics, foreign_key: :creator_id, dependent: :restrict_with_exception
  has_many :topic_comments, class_name: 'Topic::Comment', dependent: :restrict_with_exception

  validates :email, uniqueness: true, presence: true, email: true
  validates :login, uniqueness: true, presence: true

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :inactive
    state :active

    event :confirm do
      transition waiting_confirmation: :active
    end

    event :deactivate do
      transition from: :active, to: :inactive
    end

    before_transition waiting_confirmation: :active, do: :set_confirmed_at
  end

  #NOTE @see topic.rb
  include UserRepository

  def generate_confirmation_token
    self.confirmation_token = Token.generate
  end

  def generate_reset_password_token
    self.reset_password_token = Token.generate
  end

  def to_s
    login
  end

  private

  def set_confirmed_at
    self.confirmed_at = Time.current
  end
end
