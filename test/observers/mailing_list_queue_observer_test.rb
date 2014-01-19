require 'test_helper'

class MailingListQueueObserverTest < ActiveSupport::TestCase
  setup do
    @mailing_list = create :mailing_list
  end

  test "#before_process" do
    @mailing_list.process

    @mailing_list.mailing_list_users.each do |relation|
      assert { relation.processed? }
    end
  end
end
