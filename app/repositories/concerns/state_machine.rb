module Concerns
  module StateMachine
    extend ActiveSupport::Concern

    included do
      state_machines.each do |name, sm|
        sm.states.each do |s|
          scope_name = sm.namespace.present? ? :"#{sm.namespace}_#{s.name}" : s.name
          scope scope_name, -> { where(name => s.name) }
        end
      end
    end
  end
end
