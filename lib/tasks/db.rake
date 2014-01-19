namespace :db do
  desc "backup"
  task backup: :environment do
    puts "backup perform -t backup -c #{Rails.root.join("config/backup.rb")}"
  end
end
