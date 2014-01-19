require 'test_helper'

class MailingListWorkerTest < ActiveSupport::TestCase
  setup do
    @worker = MailingListWorker.new
    @list = create :mailing_list
  end

  test "#perform" do
    @members = @list.course.members
    @worker.perform @list.id

    assert { @list.users == @members.map(&:user) }
  end
end
