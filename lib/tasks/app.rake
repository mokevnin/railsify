namespace :app do
  namespace :mailing do
    desc "send daily digest (lessons list)"
    task send_daily_digest: :environment do
      #FIXME add airbrake
      Mailing.send_daily_digest
    end
  end
end
