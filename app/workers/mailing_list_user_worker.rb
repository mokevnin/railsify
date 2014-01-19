class MailingListUserWorker
  include ApplicationWorker

  def perform(id)
    list_user = MailingListUser.find(id)
    if list_user.unprocessed?
      UserMailer.send_mailing_list(list_user).deliver
      #NOTE we always use state machine for jobs
      list_user.process
    end
  end
end
