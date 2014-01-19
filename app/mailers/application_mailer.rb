class ApplicationMailer < ActionMailer::Base
  default_url_options[:host] = configus.host
  default from: "#{configus.host} <#{configus.mailer.from}>",
    content_transfer_encoding: '7bit'
end
