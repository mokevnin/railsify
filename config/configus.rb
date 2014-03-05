#FIXME hack
conf = YAML.load_file(File.join "config", "secrets.yml")

Configus.build Rails.env do
  env :production do
    basic_auth conf["production"]["basic_auth"]
    airbrake conf["production"]["airbrake"]

    host 'coursify.ru'
    mailer do
      from "noreply@coursify.ru"
    end
    facebook conf["production"]["facebook"]
  end

  env :development, parent: :production do
    host 'courisfy.me'
    facebook conf["development"]["facebook"]
  end

  env :test, parent: :development do
  end
end
