class LocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    http_accept_language ||= request.env["http_accept_language.parser"] || Parser.new("")
    http_locale = http_accept_language.compatible_language_from(I18n.available_locales)
    I18n.locale = :ru #TODO request.session[:current_locale] || http_locale || I18n.default_locale

    @app.call(env)
  end
end
