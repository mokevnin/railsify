class ErrorLogObserver < ApplicationObserver
  observe Course

  def after_validation(obj)
    if obj.errors.any?
      dump = obj.errors.full_messages
      Rails.logger.debug(Term::ANSIColor.red("#{obj.class} errors: "))
      Rails.logger.debug(Term::ANSIColor.red(dump.inspect))
    end
  end
end
