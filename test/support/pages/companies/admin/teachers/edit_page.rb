class Companies::Admin::Teachers::EditPage < ApplicationPage
  set_url '/admin/teachers/{id}/edit'

  element :state_event, "#company_teacher_state_event"
  element :submit, "input[name=commit]"

  def update(attrs)
    if attrs[:state_event]
      state_event.select Company::Teacher.human_state_event_name(attrs[:state_event])
    end
    submit.click
  end
end
