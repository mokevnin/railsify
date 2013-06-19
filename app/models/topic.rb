class Topic < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  #TODO запилить ограничение в 3 хаба
  has_many :hubs
  #TODO добавить условный cache_counter
  has_many :comments

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

  #NOTE включаем после state_machine для автогенерации скоупов
  include TopicRepository
end
