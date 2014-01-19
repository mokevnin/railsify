class Companies::Admin::News::NewPage < ApplicationPage
  set_url url_helpers.new_company_admin_news_path

  section :news_fields, Companies::Admin::NewsFieldsSection, "form.simple_form"

  def create(attrs)
    f = news_fields
    f.name.set attrs[:name]
    f.body.set attrs[:body]
    f.slug.set attrs[:slug]
    if attrs[:state_event]
      f.state_event.select Company::News.human_state_event_name(attrs[:state_event])
    end
    f.submit.click
  end
end
