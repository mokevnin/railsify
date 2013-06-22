Configus.build Rails.env do
  env :production do
    mailer do
      host "habrahabr.heroku.com"
      from "noreply@habrahabr.heroku.com"
    end
  end

  env :development, parent: :production do

  end

  env :test, parent: :production do

  end
end
