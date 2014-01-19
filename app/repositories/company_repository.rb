module CompanyRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :web, -> { active }
  end
end
