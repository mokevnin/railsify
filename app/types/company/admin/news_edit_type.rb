class Company::Admin::NewsEditType < Company::News
  include ApplicationType

  permit :name, :body, :slug, :state_event, :picture, :picture_cache, :published_at
end
