class Companies::Admin::MailingLists::IndexPage < ApplicationPage
  set_url url_helpers.company_admin_mailing_lists_path

  sections :mailing_lists, ::Companies::Admin::MailingListRowSection, "table#mailing_lists tr.mailing_list"
end
