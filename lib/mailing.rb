module Mailing
  def self.send_daily_digest
    #TODO часовые пояса?
    @users = User.with_lessons_for_half_day
    #TODO когда вырастим, ввести стейты
    @users.find_each do |user|
      UserMailer.daily_digest(user).deliver
    end
  end
end
