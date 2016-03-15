class PagesController < ApplicationController
  expose(:page)

  def index
    @events = EventDecorator.new(Event.all)
  end

  def show
  end
end
