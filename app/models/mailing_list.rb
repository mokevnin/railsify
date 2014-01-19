class MailingList < ActiveRecord::Base
  belongs_to :creator, class_name: User
  belongs_to :course

  has_many :mailing_list_users, dependent: :destroy
  has_many :users, through: :mailing_list_users

  validates :creator, presence: true
  validates :course, presence: true
  validates :title, presence: true
  validates :body, presence: true

  state_machine initial: :unprocessed do
    state :unprocessed
    state :started
    state :processed

    event :process do
      transition [:unprocessed] => :processed
    end
  end

  include MailingListRepository

  def to_s
    title
  end
end
