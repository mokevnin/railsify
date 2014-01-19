class MailingListWorker
  include ApplicationWorker

  def perform(id)
    list = MailingList.find(id)
    list.course.members.find_each do |m|
      relation = list.mailing_list_users.create(user: m.user)
      MailingListUserWorker.perform_async(relation.id)
    end
  end
end
