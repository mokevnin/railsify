# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

#FIXME
# job_type :backup, "cd :path && rvm use 2.0.0 do bundle exec backup perform -t general -c config/backup/config.rb -l tmp/backup/log -d tmp/backup/data --tmp-path=tmp/backup/tmp --cache-path=tmp/backup/cache"

#NOTE how we work with cron
every 12.hours do
  rake "db:backup"
end

# every 24.hours do
#   rake "app:mailing:send_daily_digest"
# end

# Learn more: http://github.com/javan/whenever
