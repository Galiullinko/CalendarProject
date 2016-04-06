class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?

  def toDecorator()
    if object != nil
      object = EventDecorator.new(object)
    end
  end

end
