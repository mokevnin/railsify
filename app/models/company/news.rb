class Company::News < ActiveRecord::Base
  belongs_to :company
  belongs_to :creator, class_name: User

  validates :name, presence: true
  validates :body, presence: true
  validates :slug, presence: true, slug: true, uniqueness: {scope: :company_id}

  mount_uploader :picture, NewsUploader

  state_machine initial: :draft do
    state :draft
    state :published

    event :publish do
      transition draft: :published
    end
  end

  include Company::NewsRepository

  def to_s
    name
  end
end
