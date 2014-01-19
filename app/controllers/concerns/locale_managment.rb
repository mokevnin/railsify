module Concerns
  module LocaleManagment
    def switch_locale(locale = I18n.locale)
      case locale
      when :ru
        :en
      when :en
        :ru
      end
    end
  end
end
