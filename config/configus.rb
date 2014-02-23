#FIXME hack
conf = YAML.load_file(File.join "config", "secrets.yml")

Configus.build Rails.env do
  env :production do
    host 'coursify.ru'
    carrierwave do
      storage :fog
    end
    mailer do
      from "noreply@coursify.ru"
    end
    facebook conf["production"]["facebook"]
  end

  env :development, parent: :production do
    host 'courisfy.me'
    carrierwave do
      storage :file
    end
    facebook conf["development"]["facebook"]
  end

  env :test, parent: :development do
  end
end
