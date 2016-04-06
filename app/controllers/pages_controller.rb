class PagesController < ApplicationController
  expose(:page)

  def index
    @events = Event.all
  end

  def show
  end
end
