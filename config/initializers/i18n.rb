class I18n::Backend::Simple
  def lookup(locale, key, scope = [], options = {})
    result = super
    unless result
      Rails.logger.debug(Term::ANSIColor.white("I18n lookup: #{scope}.#{key}"))
    end
    result
  end
end

module I18n
  class JustRaiseExceptionHandler < ExceptionHandler
    def call(exception, locale, key, options)
      if [MissingTranslation, InvalidLocale, ReservedInterpolationKey, MissingInterpolationArgument, InvalidPluralizationData].include?(exception.class)
        msg = exception.to_exception.message
        Rails.logger.debug(Term::ANSIColor.green("I18n: #{msg}"))
      end

      super
    end
  end
end

I18n.exception_handler = I18n::JustRaiseExceptionHandler.new
