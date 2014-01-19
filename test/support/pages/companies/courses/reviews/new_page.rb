class Companies::Courses::Reviews::NewPage < ApplicationPage
  set_url '/courses/{course_id}/reviews/new'

  element :body, "#course_review_body"
  element :submit, "input[name=commit]"

  def create(text)
    body.set text
    submit.click
  end
end
