class ApplicationDecorator < Draper::Decorator
  delegate :to_s, to: :source
end
