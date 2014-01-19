class Company::Page < ActiveRecord::Base
  belongs_to :company
  belongs_to :creator, class_name: User

  validates :company, presence: true
  validates :creator, presence: true
  validates :name, presence: true
  validates :body, presence: true
  validates :slug, presence: true, slug: true, uniqueness: {scope: :company_id}

  state_machine initial: :draft do
    state :draft
    state :published

    event :publish do
      transition draft: :published
    end

    event :unpublish do
      transition all => :draft
    end
  end

  include Company::PageRepository

  def to_s
    name
  end
end
