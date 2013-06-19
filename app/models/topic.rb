class Topic < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  #TODO запилить ограничение в 3 хаба
  has_many :hubs

  #NOTE валидируем объект, а не id
  validates :creator, presence: true
  validates :name, presence: true
  validates :body, presence: true

  state_machine initial: :draft do
    state :draft
    state :published

    event :published do
      transition draft: :published
    end
  end
end
