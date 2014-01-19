class Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :total_count,
    :exists?
end
