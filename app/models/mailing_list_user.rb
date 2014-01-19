class MailingListUser < ActiveRecord::Base
  belongs_to :mailing_list
  belongs_to :user

  validates :user, presence: true
  validates :mailing_list, presence: true

  state_machine initial: :unprocessed do
    state :unprocessed
    state :processed

    event :process do
      transition [:unprocessed] => :processed
    end
  end

  include MailingListUserRepository
end
