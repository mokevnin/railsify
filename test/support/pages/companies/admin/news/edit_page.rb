class Companies::Admin::News::EditPage < ApplicationPage
  set_url '/admin/news/{id}/edit'

  section :news_fields, Companies::Admin::NewsFieldsSection, "form.simple_form"

  def update(attrs)
    f = news_fields
    f.name.set attrs[:name]
    if attrs[:state_event]
      f.state_event.select Company::News.human_state_event_name(attrs[:state_event])
    end
    f.submit.click
  end
end
