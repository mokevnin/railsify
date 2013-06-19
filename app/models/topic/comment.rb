class Topic::Comment < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :topic

  validates :creator, presence: true
  validates :topic, presence: true

  state_machine initial: :published do
    state :published
  end
end
