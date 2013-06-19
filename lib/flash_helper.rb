module FlashHelper
  def f(key, options = {})
    scope = [:flash]
    scope << params[:controller].split('/')
    scope << params[:action]

    msg = I18n.t(key, scope: scope)
    Rails.logger.debug(Term::ANSIColor.green("flash: #{msg}"))
    if options[:now]
      flash[key] = msg
    else
      flash.now[key] = msg
    end
  end
end
