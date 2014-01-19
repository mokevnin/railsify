require 'test_helper'

class MailingListUserWorkerTest < ActiveSupport::TestCase
  setup do
    @worker = MailingListUserWorker.new
    @list_user = create :mailing_list_user
  end

  test "#perform" do
    @worker.perform @list_user.id

    assert { !ActionMailer::Base.deliveries.empty? }

    @list_user.reload
    assert { @list_user.processed? }
  end
end
