class Companies::Admin::NewsFieldsSection < ApplicationSection
  element :state_event, "#company_news_state_event"
  element :name, "#company_news_name"
  element :body, "#company_news_body"
  element :slug, "#company_news_slug"
  element :submit, "input[name=commit]"
end
