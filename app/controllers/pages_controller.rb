class PagesController < ApplicationController
  def home
    @events = Event.all.decorate
  end
end
