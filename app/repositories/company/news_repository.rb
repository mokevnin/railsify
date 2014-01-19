module Company::NewsRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :web, -> { published.order(published_at: :desc, created_at: :desc)}
  end
end
