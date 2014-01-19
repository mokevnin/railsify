class Course::Review < ActiveRecord::Base
  belongs_to :creator, class_name: User
  belongs_to :course

  validates :creator, presence: true
  validates :course, presence: true
  validates :body, presence: true

  state_machine initial: :on_moderate do
    state :on_moderate
    state :published
    state :archived

    event :publish do
      transition [:on_moderate] => :published
    end

    event :to_moderate do
      transition [:published] => :on_moderate
    end

    event :archive do
      transition all => :archived
    end
  end

  include Course::ReviewRepository

  def to_s
    body
  end
end
