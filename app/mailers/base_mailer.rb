class BaseMailer < ActionMailer::Base
  default_url_options[:host] = configus.mailer.host
  default from: configus.mailer.from,
    content_transfer_encoding: '7bit'

end
