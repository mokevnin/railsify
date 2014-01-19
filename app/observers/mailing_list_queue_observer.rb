class MailingListQueueObserver < ApplicationObserver
  observe MailingList

  def before_process(obj, transition)
    MailingListWorker.perform_async(obj.id)
  end
end
