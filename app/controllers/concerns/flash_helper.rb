module Concerns
  module FlashHelper
    def f(key, options = {})
      scope = [:flash]

      default_scope = scope.dup
      default_scope << 'base' << params[:action]

      default_msg = I18n.t(key, scope: default_scope)

      current_scope = scope.dup
      current_scope << params[:controller].split('/')
      current_scope << params[:action]

      msg = I18n.t(key, scope: current_scope, default: default_msg)
      #NOTE цветное логирование
      Rails.logger.debug(Term::ANSIColor.green("flash: #{msg}"))
      if options[:now]
        flash.now[key] = msg
      else
        flash[key] = msg
      end
    end
  end
end
