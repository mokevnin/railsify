#TODO запилить поле kind с гемом enumeraize (перевод/своя статья)
class Topic < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  #TODO запилить ограничение в 3 хаба
  has_many :hubs
  has_many :category_hubs, through: :hubs
  #TODO добавить условный cache_counter
  has_many :comments

  #NOTE валидируем объект, а не id
  validates :creator, presence: true
  validates :name, presence: true, uniqueness: true
  validates :body, presence: true

  accepts_nested_attributes_for :category_hubs

  state_machine initial: :draft do
    state :draft
    state :published

    event :publish do
      transition draft: :published
    end
  end

  #NOTE включаем после state_machine для автогенерации скоупов
  include TopicRepository

  def to_s
    name
  end
end
