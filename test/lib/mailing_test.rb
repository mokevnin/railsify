require 'test_helper'

class MailingTest < ActiveSupport::TestCase
  setup do
    @user = create :user
    @course = create :offline_course
    @course.member_users << @user
  end

  test "#send_daily_digest" do
    Mailing.send_daily_digest
  end
end
