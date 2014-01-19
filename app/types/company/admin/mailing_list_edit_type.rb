class Company::Admin::MailingListEditType < MailingList
  include ApplicationType

  permit :title, :body, :state_event, :course_id
end
