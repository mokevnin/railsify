module Concerns
  module TitleHelper
    def base_title
      title t("title.base")
    end

    def title(part = nil)
      @parts ||= []
      unless part
        return nil if @parts.blank?
        return @parts.reverse.join(' - ')
      end
      @parts << part
    end
  end
end
