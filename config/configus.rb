Configus.build Rails.env do
  env :production do
    host 'coursify.ru'
    carrierwave do
      storage :fog
    end
    mailer do
      from "noreply@coursify.ru"
    end
  end

  env :development, parent: :production do
    host 'courisfy.me'
    carrierwave do
      storage :file
    end
  end

  env :test, parent: :production do
  end
end
