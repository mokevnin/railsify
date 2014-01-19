class Companies::Admin::Reviews::EditPage < ApplicationPage
  set_url '/admin/reviews/{id}/edit'

  element :body, "#course_review_body"
  element :submit, "input[name=commit]"

  def update(b)
    body.set b
    submit.click
  end
end
