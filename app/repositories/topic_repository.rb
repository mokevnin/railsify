module TopicRepository
  extend ActiveSupport::Concern

  included do
    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end
  end
end
