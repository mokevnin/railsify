module Course::ReviewRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :latest, -> { published.order(created_at: :desc).take(3) }
    scope :web, -> { published.order(created_at: :desc) }
  end
end
