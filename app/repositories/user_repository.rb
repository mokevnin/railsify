module UserRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :web, -> { order(created_at: :desc) }
    scope :without_company_teachers, ->(company) { where.not(id: company.teachers) }
    scope :without_company_managers, ->(company) { where.not(id: company.managers) }
    # scope :with_lessons_for_half_day, -> { join}

    mix :teacher_role do
      has_many :company_teachers_with_courses, -> { joins(:courses) }, class_name: 'Company::Teacher'
      has_many :teach_in_with_courses, through: :company_teachers_with_courses,
        source: :company
    end
  end
end
