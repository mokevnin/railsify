class Companies::Admin::Reviews::IndexPage < ApplicationPage
  set_url url_helpers.company_admin_reviews_path

  sections :reviews, ::Companies::Admin::ReviewRowSection, "table#reviews tr.review"
end
