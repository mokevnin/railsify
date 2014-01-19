class Companies::Admin::MailingListRowSection < ApplicationSection
  element :state_button, ".event-switcher"
  elements :event_links, ".event-switcher .switch-state"
end
