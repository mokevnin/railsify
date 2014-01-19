class UserMailer < ApplicationMailer
  def confirmation_instructions(user)
    @user = user
    mail(to: user.email)
  end

  def remind_password(user)
    @user = user
    mail(to: user.email)
  end

  def join_to_course(course_member)
    @user = course_member.user.decorate
    @course = course_member.course.decorate
    #FIXME запилить в рельсовом мейлере плейсхолдеры для переводов
    mail(to: @user.email)
  end

  def leave_course(user)
    @user = user
    mail(to: @user.email)
  end

  def send_mailing_list(list_user)
    @user = list_user.user
    @mailing_list = list_user.mailing_list
    mail(to: @user.email, subject: @mailing_list.title)
  end

  def daily_digest(user)
    @user = user.decorate
    mail(to: @user.email)
  end
end
