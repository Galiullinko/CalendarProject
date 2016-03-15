class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?

  def has_event(date)
    if Event.all.find_by(start_time: date) != nil
      h.content_tag :p, 'Hello'
    end
  end

end
